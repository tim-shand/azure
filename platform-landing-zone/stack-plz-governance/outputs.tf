# Stack: Governance [Outputs] ----------------------------------#

output "mg_root" {
  description = "Name ID of the top-level management group."
  value       = module.plz-gov-management-groups.mg_root
}

output "mg_child" {
  description = "List of Management Groups and subscription associations."
  value       = module.plz-gov-management-groups
}

output "mg_child_keys" {
  description = "List of Management Groups short codes for policy assignments."
  value       = module.plz-gov-management-groups.mg_child_keys
}

output "policy_custom_def" {
  description = "List of custom policy definitions."
  value       = module.plz-gov-policy-definitions.policy_custom_def
}
