#==============================================================#
# Platform LZ: Observability (Logging, Monitoring, Diagnostics)
#==============================================================#

locals {
  stack_naming_prefix = "${var.naming["prefix"]}-${var.naming["service"]}-log-mon" # Combine name parts in to single variable.
  # Setup truncated Storage Account naming. 
  sa_name_max_length = 19 # Random integer suffix will add 5 chars, so max = 19 for base name.
  sa_name_base       = "${var.naming["prefix"]}${var.naming["service"]}${var.naming["project"]}logsa${random_integer.rndint.result}"
  sa_name            = length(local.sa_name_base) > local.sa_name_max_length ? substr(local.sa_name_base, 0, local.sa_name_max_length - 5) : local.sa_name_base
}

# Generate a random integer to use for suffix for uniqueness.
resource "random_integer" "rndint" {
  min = 10000
  max = 99999
}

# Create Resource Group.
resource "azurerm_resource_group" "plz_observability" {
  name     = "${local.stack_naming_prefix}-rg"
  location = var.location
  tags     = var.tags
}

#======================================#
# Monitoring: Log Analytics
#======================================#

# Storage Account for centralized logs.
resource "azurerm_storage_account" "plz_observability" {
  name                       = local.sa_name
  resource_group_name        = azurerm_resource_group.plz_observability.name
  location                   = azurerm_resource_group.plz_observability.location
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  account_kind               = "StorageV2"
  https_traffic_only_enabled = true
  tags                       = var.tags
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "plz_observability" {
  name                = "${local.stack_naming_prefix}-law"
  resource_group_name = azurerm_resource_group.plz_observability.name
  location            = azurerm_resource_group.plz_observability.location
  tags                = var.tags
  sku                 = var.law_config.sku
  retention_in_days   = var.law_config.retention_days
}
