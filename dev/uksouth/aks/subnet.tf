module "azure-aks-node-subnet" {
  source = "../../../modules/subnet"

  enabled              = var.config.aks_node_subnet.enabled
  subnet_name          = var.config.aks_node_subnet.subnet_name
  subnet_cidr          = var.config.aks_node_subnet.subnet_cidr
  resource_group_name  = module.azure-resource-group.resource_group_name[0]
  virtual_network_name = module.azure-virtual-network.azure-vnet-name[0]
}

module "azure-aks-apiserver-subnet" {
  source = "../../../modules/subnet"

  enabled              = var.config.aks_apiserver_subnet.enabled
  subnet_name          = var.config.aks_apiserver_subnet.subnet_name
  subnet_cidr          = var.config.aks_apiserver_subnet.subnet_cidr
  resource_group_name  = module.azure-resource-group.resource_group_name[0]
  virtual_network_name = module.azure-virtual-network.azure-vnet-name[0]
  subnet_delegation = {
    "apiserver" = {
      subnet_delegation_enabled = var.config.aks_apiserver_subnet.subnet_delegation_enabled
      name                      = var.config.aks_apiserver_subnet.delegation_name

      service_delegation = [
        {
          name    = var.config.aks_apiserver_subnet.service_delegation_name
          actions = var.config.aks_apiserver_subnet.actions
        }
      ]
    }
  }
}

module "azure-aks-virtualnode-subnet" {
  source = "../../../modules/subnet"

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
