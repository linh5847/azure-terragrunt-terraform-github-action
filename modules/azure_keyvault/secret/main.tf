resource "azurerm_key_vault_secret" "keysecret" {
  name         = var.keysecret_name
  value        = var.keysecret_value
  key_vault_id = azurerm_key_vault.keyvault.id

}