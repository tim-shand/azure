# Governance: Management Groups -----------------#

output "plz_governance_mg_root" {
  description = "Name ID of the top-level management group."
  value       = module.plz_governance.plz_governance_mg_root.id
}

