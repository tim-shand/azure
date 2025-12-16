#=====================================================#
# Platform LZ: Governance (Management Groups & Policy)
#=====================================================#

# Create core top-level management group for the organization.
resource "azurerm_management_group" "plz_governance_mg_root" {
  name         = var.gov_management_group_root
  display_name = var.gov_management_group_root
}

# Create child management groups.
resource "azurerm_management_group" "plz_governance_mg" {
  for_each                   = var.gov_management_group_list            # Loop for each defined management group in variable. 
  name                       = "${var.naming["prefix"]}-${each.key}-mg" # Use key title in naming.
  display_name               = each.value.mg_display_name               # Get from each object looped. 
  parent_management_group_id = azurerm_management_group.plz_governance_mg_root.id
}
