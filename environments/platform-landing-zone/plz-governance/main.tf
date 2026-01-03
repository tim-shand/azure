# Stack: Governance ----------------------------------#

module "plz_governance" {
  source                       = "../../modules/plz-governance"
  location                     = var.location
  naming                       = var.naming
  tags                         = var.tags
  gov_management_group_root    = var.gov_management_group_root    # Top level management group name to deploy. 
  gov_management_group_list    = var.gov_management_group_list    # List of management group names to deploy. 
  gov_policy_builtin           = var.gov_policy_builtin           # Provided via list variable. 
  gov_policy_allowed_locations = var.gov_policy_allowed_locations # List of approved locations. 
}
