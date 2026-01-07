# General  -----------------#

variable "subscription_id" {
  description = "Subscription ID for the target changes. Provided by workflow variable."
  type        = string
}

variable "stack_code" {
  description = "Short code used for stack resource naming."
  type        = string
}

variable "global" {
  description = "Map of static global variables (location etc) used for all deployments."
  type        = map(string)
  nullable    = false
}

variable "naming" {
  description = "A map of naming values to use with resources."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to apply to resources."
  type        = map(string)
  default     = {}
}

# Governance: Management Groups -----------------#

variable "management_group_root" {
  description = "Name of the top-level Management Group (root)."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.management_group_root)) # Only allow alpha-numeric with dashes.
    error_message = "Management Group IDs can only contain letters, numbers, and dashes (-). No spaces or other symbols are allowed."
  }
}

variable "management_group_list" {
  description = "Map of Management Group configuration to deploy."
  type = map(object({ # Use object variable name as management group 'name'.
    display_name            = string
    subscription_identifier = optional(string)       # Used to identify existing subscriptions to add to the management group.
    subscription_list       = optional(list(string)) # Provide raw subscription IDs if not match 'subcription_identifier'. 
  }))
  validation {
    condition = alltrue([
      for key in keys(var.management_group_list) : # Ensure that provided Management Group IDs are valid.
      can(regex("^[a-zA-Z0-9-]+$", key))           # Check each object key to ensure it fits the regex requirements. 
    ])
    error_message = "Management Group IDs can only contain letters, numbers, and dashes (-). No spaces or other symbols are allowed."
  }
}

# Governance: Policy Assignments -----------------#

variable "policy_builtin" {
  description = "Map of built-in policies and initiatives, required for top-level assignment."
  type = map(object({
    id           = string
    display_name = string
  }))
}

variable "policy_allowed_locations" {
  description = "List of allowed resource locations approved when assigning policy."
  type        = list(string)
  validation {
    condition     = length(var.policy_allowed_locations) >= 1
    error_message = "At least one allowed location must be provided."
  }
}
