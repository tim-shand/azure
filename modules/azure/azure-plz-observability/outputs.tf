output "plz_log_rg_name" {
  value       = azurerm_resource_group.plz_observability.name
  description = "Resource Group for Azure logging."
}

output "plz_log_sa_name" {
  value       = azurerm_storage_account.plz_observability.name
  description = "Storage Account for Azure logging."
}

# output "plz_log_amw_id" {
#   value = azurerm_monitor_workspace.plz_observability.id
#   description = "Azure Monitor Workspace ID."
# }
