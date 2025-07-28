output "keyvault_certificate_id" {
  value = one(azurerm_key_vault_certificate.keycert[*].id)
}

output "keyvault_certificate_secret_id" {
  value = one(azurerm_key_vault_certificate.keycert[*].secret_id)
}

output "keyvault_certificate_name" {
  value = one(azurerm_key_vault_certificate.keycert[*].name)
}

output "keyvault_certificate_data" {
  value = one(azurerm_key_vault_certificate.keycert[*].certificate_data)
}

output "keyvault_certificate_data_base64" {
  value = one(azurerm_key_vault_certificate.keycert[*].certificate_data_base64)
}