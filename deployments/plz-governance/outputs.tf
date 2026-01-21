output "policy_builtin_assignment" {
  description = "List of assigned built-in policy initiatives."
  value       = module.gov_policy_initiatives_builtin[0].configuration
}

output "policy_definitions_custom" {
  description = "List of custom policy definitions."
  value       = module.gov_policy_definitions_custom.policies
}

output "policy_initiatives_custom" {
  description = "Map of custom policy initiative names and IDs."
  value       = module.gov_policy_initiatives_custom.initiatives
}
