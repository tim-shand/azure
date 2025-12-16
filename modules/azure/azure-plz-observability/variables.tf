variable "location" {
  description = "Target location for resources."
  type        = string
}

variable "naming" {
  description = "Map of naming conventions used for resources."
  type        = map(string)
}

variable "tags" {
  description = "Map of key/value pairs used for resource tagging."
  type        = map(string)
}

variable "law_config" {
  description = "Map of Log Analytics configuration."
  type = map(object({ # Use object name as 'name'.
    sku            = list(string)
    retention_days = string
  }))
}
