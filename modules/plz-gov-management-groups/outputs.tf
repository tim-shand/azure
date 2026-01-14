output "mg_root" {
  description = "Name ID of the top-level management group."
  value       = azurerm_management_group.mg_root
}

output "mg_child_keys" {
  description = "Management Group keys"
  value       = keys(azurerm_management_group.mg_child)
}
