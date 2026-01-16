output "full" {
  description = "Full length naming structure."
  value       = local.name_full
}

output "short" {
  description = "Short length naming structure (remove delimiter and condense length)."
  value       = local.name_short
}

output "org_prefix" {
  description = "Organisation prefix, used in resource naming."
  value       = local.org_prefix
}

output "project" {
  description = "Project name or code, used in resource naming."
  value       = local.project
}

output "category1" {
  description = "Category name section, used in resource naming."
  value       = local.category1
}

output "category2" {
  description = "Category name section, used in resource naming."
  value       = local.category2
}

output "environment" {
  description = "Environment name section, used in resource naming."
  value       = local.environment
}
