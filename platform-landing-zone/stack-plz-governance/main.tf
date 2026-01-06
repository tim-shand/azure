# Stack: Governance [Main] ----------------------------------#

# Governance: Management Groups
module "plz-gov-management-groups" {
  source                = "../../modules/plz-gov-management-groups"
  naming                = var.naming
  management_group_root = var.management_group_root # Top level management group name (parent). 
  management_group_list = var.management_group_list # List of management groups and subscriptions to associate. 
}

