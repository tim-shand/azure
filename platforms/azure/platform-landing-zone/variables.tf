#=================================================#
# Platform LZ: Variables
#=================================================#

# General  -----------------#
variable "subscription_id" {
  description = "Subscription ID for the target changes."
  type        = string
}
variable "location" {
  description = "Azure region to deploy resources into."
  type        = string
}
variable "naming" {
  description = "A map of naming parameters to use with resources."
  type        = map(string)
  default     = {}
}
variable "tags" {
  description = "A map of tags to apply to resources."
  type        = map(string)
  default     = {}
}

# Governance: Management Groups -----------------#
variable "gov_management_group_root" {
  description = "Name of the top-level Management Group (root)."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.resource_name)) # Only allow alpha-numeric with dashes.
    error_message = "Variable can only contain letters, numbers, and dashes (-). No spaces or other symbols are allowed."
  }
}

variable "gov_management_group_list" {
  description = "Map of Management Group configuration to deploy."
  type = map(object({ # Use object variable name as management group 'name'.
    display_name      = string
    subscription_list = optional(list(strings))
  }))
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.resource_name)) # Only allow alpha-numeric with dashes.
    error_message = "Variable can only contain letters, numbers, and dashes (-). No spaces or other symbols are allowed."
  }
}

# Connectivity: Network (Hub) -----------------#
variable "hub_vnet_space" {
  description = "IP address space for Hub vNet."
  type        = string
}
variable "hub_subnets" {
  description = "Map of hub VNet subnet addresses."
  type = map(object({ # Use object name as 'name'.
    name                    = string
    address                 = list(string)
    default_outbound_access = bool
  }))
}

# Logging: Monitoring & Diagnostics -----------------#
variable "logging_law" {
  description = "Map of central Log Analytics configuration."
  type        = map(string)
}
