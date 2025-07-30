output "security_group_id" {
  value = azurerm_network_security_group.netsecurity_group[0].id
}

output "security_group_name" {
  value = azurerm_network_security_group.netsecurity_group[0].name
}
