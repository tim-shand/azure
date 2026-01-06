# Module: Platform LZ - Governance: Management Groups

This module deploys the desired management group structure as defined by variable `management_group_list`.  
Child management groups are nested under parent management group defined by variable `management_group_root`.  

## 🤖 Automated Subscription Association

A local module variable iterates through a list of all accessible subscriptions, matching the subscription display name to identify the correct management group to associate the subscription with. This enables the automatic association of subscriptions to management groups. 

**Note:** For subscription --> management group association to work, subscription display names **MUST** use a uniform naming convention. 

## 💡 Example

**Subscription:** `org-plz-connectivity-sub`  
Where the `plz` portion of the subscription name is defined within variable `management_group_list`, using the `subscription_identifier` value.  

```hcl
management_group_root = "Core" # Top level Management Group name.
management_group_list = {
  platform = {
    display_name            = "Platform" # Cosmetic name for Management Group.
    subscription_identifier = "plz"      # Used to identify existing subscriptions to add to the Management Groups. 
  }
  workloads = {
    display_name            = "Workloads"
    subscription_identifier = "app"
  }
  sandbox = {
    display_name            = "Sandbox"
    subscription_identifier = "dev"
  }
  decom = {
    display_name            = "Decommission"
    subscription_identifier = "decom"
  }
}
```

---

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group.mg_child](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |
| [azurerm_management_group.mg_root](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_management_group_list"></a> [management\_group\_list](#input\_management\_group\_list) | Map of Management Groups to deploy. | <pre>map(object({ # Use object variable name as management group 'name'.<br/>    display_name            = string<br/>    subscription_identifier = optional(string)       # Used to identify existing subscriptions to add to the management group.<br/>    subscription_list       = optional(list(string)) # Provide raw subscription IDs if not match 'subscription_identifier'. <br/>  }))</pre> | n/a | yes |
| <a name="input_management_group_root"></a> [management\_group\_root](#input\_management\_group\_root) | Name of the top-level Management Group (root). | `string` | n/a | yes |
| <a name="input_naming"></a> [naming](#input\_naming) | A map of naming values to use with resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mg_child"></a> [mg\_child](#output\_mg\_child) | List of Management Groups and subscription associations. |
| <a name="output_mg_root"></a> [mg\_root](#output\_mg\_root) | Name ID of the top-level management group. |
<!-- END_TF_DOCS -->
