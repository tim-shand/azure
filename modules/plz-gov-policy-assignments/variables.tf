# Governance: Policy -----------------#

variable "stack_code" {
  description = "Short code used for stack resource naming."
  type        = string
  validation {
    condition     = length(var.stack_code) >= 3
    error_message = "Stack code must be more than 3 characters in length."
  }
}

variable "naming" {
  description = "A map of naming values to use with resources."
  type        = map(string)
  default     = {}
}

variable "management_group_root" {
  description = "Name of the top-level Management Group (root)."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.management_group_root)) # Only allow alpha-numeric with dashes.
    error_message = "Only letters, numbers, and dashes (-) are allowed. No spaces or other symbols."
  }
}

variable "management_group_list" {
  description = "Map of Management Groups to deploy."
  type = map(object({ # Use object variable name as management group 'name'.
    display_name            = string
    subscription_identifier = optional(string)       # Used to identify existing subscriptions to add to the management group.
    subscription_list       = optional(list(string)) # Provide raw subscription IDs if not match 'subscription_identifier'. 
  }))
  validation {
    condition = alltrue([
      for key in keys(var.management_group_list) : # Ensure that provided Management Group IDs are valid.
      can(regex("^[a-zA-Z0-9-]+$", key))           # Check each object key to ensure it fits the regex requirements. 
    ])
    error_message = "Only letters, numbers, and dashes (-) are allowed. No spaces or other symbols."
  }
}

# Policy Definition Parameters

variable "policy_allowed_locations" {
  description = "List of allowed locations allowed when deploying resources."
  type        = list(string)
  validation {
    condition     = length(var.policy_allowed_locations) >= 1
    error_message = "At least one allowed location must be provided."
  }
}

variable "policy_required_tags" {
  description = "List of tag names required to be assigned to resources."
  type        = list(string)
  validation {
    condition     = length(var.policy_required_tags) >= 1
    error_message = "At least one tag must be provided."
  }
}
