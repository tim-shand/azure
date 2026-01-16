# Stack: Governance [Outputs] ----------------------------------#

output "mg_root" {
  description = "Name ID of the top-level management group."
  value       = module.plz-gov-management-groups.mg_root
}

# output "policy_custom_def" {
#   description = "List of custom policy definitions."
#   value       = module.plz-gov-policy-definitions.policy_custom_def
# }
