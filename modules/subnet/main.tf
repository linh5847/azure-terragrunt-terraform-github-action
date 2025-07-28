resource "azurerm_subnet" "subnet" {
  for_each = {
    for k, v in var.subnet_cidr : v => k if var.enabled == true
  }
  name                 = format("%s%d", var.subnet_name, each.value + 1)
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [each.key]

  #private_endpoint_network_policies_enabled     = true
  #private_link_service_network_policies_enabled = true


  dynamic "delegation" {
    for_each = {
      for delegation_key, delegation_value in var.subnet_delegation : delegation_key => delegation_value if delegation_value.subnet_delegation_enabled == true
    }

    content {
      name = lookup(delegation.value, "name", null)

      dynamic "service_delegation" {
        for_each = lookup(delegation.value, "service_delegation", [])
        content {
          name    = lookup(service_delegation.value, "name", null)
          actions = lookup(service_delegation.value, "actions", null)
        }
      }
    }
  }

}