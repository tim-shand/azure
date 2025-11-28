#=================================================#
# Workload: Personal Website (www.tshand.com)
#=================================================#

module "swa-tshand-com" {
  source            = "../../../../modules/azure/swa-webapp-basic-dns"
  location          = var.location
  subscription_id   = var.subscription_id
  naming            = var.naming
  tags              = var.tags
  swa_config        = var.swa_config
  cloudflare_config = var.cloudflare_config
}
