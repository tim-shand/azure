# Stack: Governance [Outputs] ----------------------------------#

output "mg_root" {
  description = "Name ID of the top-level management group."
  value       = module.plz-gov-management-groups.mg_root
}

output "mg_child" {
  description = "List of Management Groups and subscription associations."
  value       = module.plz-gov-management-groups.mg_child
}
