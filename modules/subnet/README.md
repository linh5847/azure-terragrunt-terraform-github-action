Subnet delegation refers to assigning the management of IP addresses within a specific subnet to a designated Azure service or resource provider. In Azure, this feature allows users to allocate the responsibility for IP management to services like Azure Kubernetes Service (AKS), Azure Functions, or Azure App Service Environment (ASE). This delegation streamlines network configuration, enhances security, and provides greater flexibility and performance for managing network resources.


variable declare as any. We need to map it proper when creating a terraform module i.e

module "azure-aks-virtualnode-subnet" {
  source = "../../modules/subnet"

  enabled              = var.config.aks_virtualnode_subnet.enabled
  subnet_name          = var.config.aks_virtualnode_subnet.subnet_name
  subnet_cidr          = var.config.aks_virtualnode_subnet.subnet_cidr
  resource_group_name  = module.azure-resource-group.resource_group_name[0]
  virtual_network_name = module.azure-virtual-network.azure-vnet-name[0]
  subnet_delegation = {
    "virtualNode" = {
      subnet_delegation_enabled = var.config.aks_virtualnode_subnet.subnet_delegation_enabled
      name                      = var.config.aks_virtualnode_subnet.delegation_name

      service_delegation = [
        {
          name    = var.config.aks_virtualnode_subnet.service_delegation_name
          actions = var.config.aks_virtualnode_subnet.actions
        }
      ]
    }
  }
}

# AKS
  
  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }

  ### API-Server
  delegation {
    name = "aks-delegation"

    service_delegation {
      name    = "Microsoft.ContainerService/managedClusters"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]  
    }
  }

  ### VirtualNode
  delegation {
    name = "aciDelegation"
    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

# PostgreSQL flexible-Servers
  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
