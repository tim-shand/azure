
data "azurerm_policy_definition" "allowed_locations" {
  display_name = "Allowed locations"
}

data "azurerm_policy_definition" "require_tag" {
  display_name = "Require a tag on resources"
}

data "azurerm_policy_definition" "append_tag" {
  display_name = "Append a tag and its value from the policy"
}

data "azurerm_policy_definition" "activity_logs_diagnostics" {
  display_name = "Deploy Diagnostic Settings for Azure Activity Logs"
}

data "azurerm_policy_definition" "secure_transfer" {
  display_name = "Secure transfer to storage accounts should be enabled"
}
