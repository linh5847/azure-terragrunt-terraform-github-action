output "azure-vnet-id" {
  #value = values(azurerm_virtual_network.vnet).*.id
  value = azurerm_virtual_network.vnet.*.id
}

output "azure-vnet-name" {
  value = azurerm_virtual_network.vnet.*.name
}

output "azure-vnet-dns-servers" {
  value = azurerm_virtual_network.vnet.*.dns_servers
}

output "azure-vnet-bgp-community" {
  value = azurerm_virtual_network.vnet.*.bgp_community
}

output "azure-vnet-edge-zone" {
  value = azurerm_virtual_network.vnet.*.edge_zone
}