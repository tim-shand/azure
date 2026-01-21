# Stack: Governance [Main] ----------------------------------#

# Governance: Policies - Builtin Initiatives
# Assign built-in policy initiatives provided by list of display names to target management group.  
module "gov_policy_initiatives_builtin" {
  count                      = var.policy_initiatives_builtin_enable ? 1 : 0 # Enable policy assignment (turns it on/off). 
  source                     = "../../modules/policy-initiatives-builtin"
  naming                     = module.naming
  builtin_initiatives        = var.policy_initiatives_builtin          # List of builtin initiative display names. 
  enforce                    = var.policy_initiatives_builtin_enforce  # Enforce policy controls (audit vs enforce).
  target_management_group_id = module.gov_management_groups.mg_root.id # Target management group for assignment. 
}

# Governance: Policies - Custom Definitions
# Build custom policy definitions from individual JSON files. 
module "gov_policy_definitions_custom" {
  source                 = "../../modules/policy-definitions-custom"
  naming                 = module.naming                       # Provide naming methods.
  stack_code             = var.naming.stack_code               # Used in display names. 
  policy_custom_def_path = "${path.module}/policy_definitions" # Location of policy definition files. 
}

# Governance: Policies - Custom Initiatives
# Assign built-in policy initiatives provided by list of display names to target management group.  
module "gov_policy_initiatives_custom" {
  source        = "../../modules/policy-initiatives-custom"
  naming        = module.naming
  stack_code    = var.naming.stack_code # Used in display names. 
  policy_groups = local.policy_groups   # Pass in local map of  
}
