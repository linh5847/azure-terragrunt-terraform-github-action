
output "keyvault_id" {
  value = one(azurerm_key_vault.keyvault[*].id)
}

output "keyvault_url" {
  value = one(azurerm_key_vault.keyvault[*].vault_uri)
}

output "keyvault_name" {
  value = one(azurerm_key_vault.keyvault[*].name)
}
