# Stack: Governance [Outputs] ----------------------------------#

output "mg_root" {
  description = "Name ID of the top-level management group."
  value       = module.gov_management_groups.mg_root
}

output "policy_custom_def" {
  description = "List of custom policy definitions."
  value       = module.gov_policy_custom_definitions.policy_custom_def
}
