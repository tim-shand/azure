terraform {
  backend "azurerm" {
    resource_group_name  = "tjs-iac-platform-rg"
    storage_account_name = "tjsiacplatformsa659359"
    container_name       = "tfstate-plz-governance"
    key                  = "azure-plz-governance.tfstate"
    use_azuread_auth     = true # Force Entra ID for authorisation over Shared Access Keys.
  }
}
