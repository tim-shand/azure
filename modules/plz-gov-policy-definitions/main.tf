#=====================================================#
# Platform LZ: Governance - Policy Definitions
#=====================================================#

locals {
  management_groups = var.management_group_keys                          # TEST
  policy_files      = fileset("${var.policy_custom_def_path}", "*.json") # Discover all policy JSON files. 

  # Decode all JSON policy files and add metadata. 
  policies = {
    for file_name in local.policy_files :         # Loop each file in the list of files. 
    trimsuffix(file_name, ".json") => jsondecode( # Create map using trimmed file name as key, parsed JSON as value. 
    file("${var.policy_custom_def_path}/${file_name}")).properties
  }

  # Match MG from file name prefixes (before first underscore). 
  policies_by_mg = {               # Create map (key: management group, value: map of policies based on name prefix). 
    for mg in distinct([           # Loop over all key/ value pairs in local.policies. Remove duplicates. 
      for k, p in local.policies : # k = the policy filename (core_allowed_locations), p = the JSON content of the policy.
      split("_", k)[0]             # Split filename on _ and take the first part, which is the MG. 
    ]) :
    mg => {                        # Iterates over each unique category (MG) to become the key of the outer map. Contain all policies that belong to this MG.
      for k, p in local.policies : # Loop again over all policies.
      k => p                       # Sets the inner map key/value: key = policy filename, value = policy content.
      if split("_", k)[0] == mg    # Only include the policy if its filename prefix matches the current MG. 
    }
    # RESULT: {
    #   core = {
    #     core_allowed_locations = { ...policy content... }
    #     core_required_tags     = { ...policy content... }
    #   }
    #   workloads = {
    #     workloads_allowed_vm_sizes = { ...policy content... }
    #   }
    # }
  }
}

# Loop each JSON file in directory and create Policy Definition. 
resource "azurerm_policy_definition" "custom" {
  for_each     = local.policies # Local map variable of policy names and content. 
  name         = each.key       # Use trimmed filename as policy definition name. 
  policy_type  = "Custom"
  mode         = each.value.mode
  display_name = "[${upper(var.stack_code)}] ${upper(split("_", each.key)[0])} - ${each.value.displayName}"
  description  = try(each.value.description, null)          # Try if it exists, use it - otherwise use null.
  metadata     = jsonencode(try(each.value.metadata, {}))   # Try if it exists, use it - otherwise empty. 
  parameters   = jsonencode(try(each.value.parameters, {})) # Try if it exists, use it - otherwise empty. 
  policy_rule  = jsonencode(each.value.policyRule)
}
