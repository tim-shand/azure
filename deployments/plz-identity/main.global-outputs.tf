#=====================================================#
# Platform LZ: Identity - Global Outputs
#=====================================================#

# Write values to the Global Outputs Key Vault for shared access. 

# Global Outputs: Stored in Key Vault
resource "azurerm_key_vault_secret" "gov_uai_policy_deployer_pid" {
  name         = var.shared_services.gov_managed_identity # Name of the Key Vault secret where Managed Identity name is to be stored. 
  value        = azurerm_user_assigned_identity.policy_deployer.principal_id
  key_vault_id = data.azurerm_key_vault.globals_kv
}
