# General -----------------#

naming = {
  stack_name = "Governance" # Full stack name. Used with tag assignment and naming. 
  stack_code = "gov"        # Short code used for resource naming. 
}

# Governance: Management Groups -----------------#

management_group_root = "Core" # Top level Management Group name.

# Subscription Prefixes: First 3 segments of subscription IDs (example: "1234-1234-1234").
# Used to assign subscriptions to management groups. 
subscription_prefixes = {
  platform              = ["56effccd-9f6c-4b5e", "8cf80f38-0042-413a"]
  workloads_production  = ["9173fb12-e761-49ab"]
  workloads_development = []
  sandbox               = ["66f229bc-adb1-4b24"]
  decommissioned        = []
}

# Governance: Policy Assignments -----------------#

policy_builtin_initiatives = ["New Zealand ISM"]
policy_custom_allowed_locations = {
  effect = "Audit" # Audit, Deny, Disabled
  locations = [
    "australiaeast",
    "australiasoutheast",
    "newzealandnorth",
    "westus2"
  ]
}
policy_custom_required_tags = {
  effect = "Audit" # Audit, Deny, Disabled
  tags = [
    "Owner",
    "Environment",
    "Project"
  ]
}
