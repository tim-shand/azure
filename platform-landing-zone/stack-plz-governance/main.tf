# Stack: Governance [Main] ----------------------------------#

# Governance: Management Groups
module "plz-gov-management-groups" {
  source                = "../../modules/plz-gov-management-groups"
  naming                = var.naming
  management_group_root = var.management_group_root # Top level management group name (parent). 
  management_group_list = var.management_group_list # List of management groups and subscriptions to associate. 
}

# Governance: Policies & Assignments
module "plz-gov-policy-assignments" {
  source                   = "../../modules/plz-gov-policy-assignments"
  naming                   = var.naming
  stack_code               = var.stack_code
  management_group_root    = module.plz-gov-management-groups.mg_root
  management_group_list    = module.plz-gov-management-groups.mg_child
  policy_allowed_locations = var.policy_allowed_locations
  policy_required_tags     = var.policy_required_tags
}
