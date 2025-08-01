output "resource_group_id" {
  #value = values(azurerm_resource_group.rg).*.id
  value = azurerm_resource_group.rg[0].id
}

output "resource_group_name" {
  value = azurerm_resource_group.rg[0].name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg[0].location
}
