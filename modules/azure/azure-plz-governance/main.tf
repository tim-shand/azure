#=====================================================#
# Platform LZ: Governance (Management Groups & Policy)
#=====================================================#

# Governance: Management Groups -----------------#

# Create top-level management group for the organization.
resource "azurerm_management_group" "plz_governance_mg_root" {
  name         = lower(var.gov_management_group_root) # Force lower-case for resource name.
  display_name = var.gov_management_group_root        # Display name is purely cosmetic. 
}

# Create child management groups.
resource "azurerm_management_group" "plz_governance_mg" {
  for_each                   = var.gov_management_group_list                      # Loop for each defined management group in variable. 
  name                       = lower("${var.naming["prefix"]}-${each.key}-mg")    # Use key title in naming.
  display_name               = each.value.display_name                            # Get from each object looped. 
  parent_management_group_id = azurerm_management_group.plz_governance_mg_root.id # Nest under initial management group. 
}
