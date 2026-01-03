# Azure: Platform Landing Zone (Governance)

- Deploy management group hierarchy. 
- Deploy policy definitions & initiatives. 
- Deploy policy assignments. 
- Deploy platform RBAC. 

## Requirements

### Subscription Naming Convention

Subscription display names **MUST** use a uniform naming convention to enable the automatic assignment to Management Groups. 
For example: `sub-mgt-azure`, where the `mgt` portion is defined in variable `gov_management_group_list` and associated to a parent amanagement group using the `subscription_identifier` value. 

