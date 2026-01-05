terraform {
  backend "azurerm" {
    resource_group_name  = "tjs-iac-bootstrap-rg"
    storage_account_name = "tjsiacbootstrapsa164204"
    container_name       = "tfstate-iac-bootstrap"
    key                  = "azure-iac-bootstrap.tfstate"
  }
}
