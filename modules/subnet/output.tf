output "subnet_id" {
  value = values(azurerm_subnet.subnet)[*].id
}

output "subnet_name" {
  value = values(azurerm_subnet.subnet).*.name
}

output "subnet_service_endpoints" {
  value = values(azurerm_subnet.subnet)[*].service_endpoints
}

output "subnet_service_endpoint_ids" {
  value = values(azurerm_subnet.subnet).*.service_endpoint_policy_ids
}