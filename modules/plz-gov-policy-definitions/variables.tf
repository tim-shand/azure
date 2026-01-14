# General  -----------------#

variable "stack_code" {
  description = "Short code used for stack resource naming."
  type        = string
}

variable "naming" {
  description = "A map of naming values to use with resources."
  type        = map(string)
  nullable    = false
}

# Governance: Policy Parameters -----------------#

variable "policy_custom_def_path" {
  description = "Local directory path containing custom policy definitions in JSON format."
  type        = string
  default     = "./policy_definitions"
}

variable "management_group_root" {
  description = "Root management group object."
  type        = string
  nullable    = false
}

variable "management_group_keys" {
  description = "String value to filter JSON file on. Used to determine MG scope (core vs workload)."
  type        = list(string)
  nullable    = false
}
