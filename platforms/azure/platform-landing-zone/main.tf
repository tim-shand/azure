#============================================#
# Platform LZ: Main Deployment
#============================================#

# Set naming conventions for resources. 
locals {
  prefix = "${var.naming.org}-${var.naming.service}-"
}

# module "plz-log-monitor-diagnostics" {
#   source = "../../../modules/plz-log-monitor-diagnostics"
#   for_each = var.enable_plz_logging ? { "log" = true } : {}
#   location = var.location # Get from TFVARS file.
#   naming = var.naming # Get from TFVARS file.
#   tags = var.tags # Get from TFVARS file.
# }
