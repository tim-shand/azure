#=====================================================#
# Platform LZ: Governance - Policy Assignment
#=====================================================#

locals {
  policies = var.gov_policy_builtin
}

# Governance: Policy Assignments (Built-In) -----------------#

# Assign to top-level management group. 
resource "azurerm_management_group_policy_assignment" "policy_assignment" {
  for_each             = length(local.policies) > 0 ? local.policies : {} # If list not empty, loop each policy name in list.
  name                 = "Policy-Assignment-${each.value}"
  policy_definition_id = each.value
  management_group_id  = azurerm_management_group.mg_root.id
}

# Governance: Policy Assignments (Custom) -----------------#

# Custom Assignment: Allowed Locations 
resource "azurerm_management_group_policy_assignment" "custom" {
  name                 = "Policy-Assignment-Allowed-Locations"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
  management_group_id  = azurerm_management_group.mg_root.id
  parameters = jsonencode({
    listOfAllowedLocations = { value = var.gov_policy_allowed_locations }
  })
  lifecycle {
    precondition {
      condition     = var.gov_policy_allowed_locations >= 1
      error_message = "At least one allowed location must be provided."
    }
  }
}
