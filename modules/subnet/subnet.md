# Another way of constructing the subnet with for_each as follows.

resource "azurerm_subnet" "subnets" {
  for_each             = var.m_subnets
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  address_prefixes     = each.value.subnet_address_prefixes

  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", [])
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

variable "m_subnets" {
  type = any
}

module "subnet" {
  source = "./"

  m_subnets = {
    hubsubnet = {
      subnet_address_prefixes = ["10.0.1.0/24"]
      delegation = [
        {
          name = "hubdelegation"
          service_delegation = [
            {
              name   = "Microsoft.ContainerInstance/containerGroups"
              action = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          ]
        }
      ]
    }
    intsubnet = {
      subnet_address_prefixes = ["10.0.5.0/24"]
    }
  }
}