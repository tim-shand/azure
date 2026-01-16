# Stack: Governance [Main] ----------------------------------#

# Deployment Naming ----------------------------------------------------|
# Generate uniform, consistent name outputs to be used with resources.  
module "naming" {
  source     = "../../../modules/global-resource-naming"
  org_prefix = var.global.naming.org_prefix
  project    = var.global.naming.project_short
  category1  = var.naming.stack_code
}

# Governance: Management Groups
# Used to manage subscription and policy assignment hierarchy. 
module "gov_management_groups" {
  source                = "../../../modules/gov-mg-sub-assignments"
  naming                = module.naming             # Provide naming methods. 
  management_group_root = var.management_group_root # Top level management group name (parent).  
  subscription_prefixes = var.subscription_prefixes # Map of lists, mapping management groups and subscriptions. 
}

# Governance: Policies - Generate Custom Definitions
module "gov_policy_custom_definitions" {
  source                 = "../../../modules/gov-policy-custom-definitions"
  naming                 = module.naming # Provide naming methods.
  stack_code             = var.naming.stack_code
  policy_custom_def_path = "${path.module}/policy_definitions" # Location of policy definition files. 
}

# Governance: Assign Builtin Policy Initiatives
# Use provided variable value to assign a built-in policy initiative. 
data "azurerm_policy_set_definition" "builtin" {
  for_each     = var.policy_builtin_initiatives # Loop each string value in variable to get data on policy initiative. 
  display_name = each.key
}

resource "azurerm_management_group_policy_assignment" "builtin_core" {
  for_each             = data.azurerm_policy_set_definition.builtin # For each policy initiative in the data call. 
  name                 = each.key
  display_name         = "[${upper(var.naming.stack_code)}] Built-In - ${each.key}"
  description          = each.value.description
  policy_definition_id = data.azurerm_policy_set_definition.builtin[each.key].id
  management_group_id  = module.gov_management_groups.mg_root.id # Where to assign the initiative (core). 
  enforce              = var.policy_builtin_initiative_enforce   # True/False
}
