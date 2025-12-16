#============================================#
# Platform LZ: Main Deployment
#============================================#

# Set globally used local variables.
locals {
  module_path = "../../../modules/azure"                  # Path to modules directory. 
  prefix      = "${var.naming.org}-${var.naming.service}" # Default naming prefix. 
}

# Stack: Governance ----------------------------------#
module "plz_governance" {
  source                    = "${local.module_path}/azure-plz-governance"
  gov_management_group_root = var.gov_management_group_root
  gov_management_group_list = var.gov_management_group_list
}

