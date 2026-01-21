output "management_group_root_id" {
  description = "ID of the top-level (root) Management Group."
  value       = azurerm_management_group.root.id
}

output "management_groups_subs_level1" {
  value = local.management_groups_subs_level1
}

output "management_groups_subs_level2" {
  value = local.management_groups_subs_level2
}

output "management_groups_subs_level3" {
  value = local.management_groups_subs_level3
}

output "management_groups_subs_level4" {
  value = local.management_groups_subs_level4
}

output "management_group_subscriptions" {
  value = merge(
    local.management_groups_subs_level1,
    local.management_groups_subs_level2,
    local.management_groups_subs_level3,
    local.management_groups_subs_level4
  )
}
