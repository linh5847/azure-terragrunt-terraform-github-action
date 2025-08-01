output "azure_vnet_id" {
  #value = values(azurerm_virtual_network.vnet).*.id
  value = azurerm_virtual_network.vnet[0].id
}

output "azure_vnet_name" {
  value = azurerm_virtual_network.vnet[0].name
}

output "azure_vnet_dns_servers" {
  value = azurerm_virtual_network.vnet[0].dns_servers
}

output "azure_vnet_bgp_community" {
  value = azurerm_virtual_network.vnet[0].bgp_community
}

output "azure_vnet_edge_zone" {
  value = azurerm_virtual_network.vnet[0].edge_zone
}
