module "azure_aks_node_subnet" {
  source = "../../../modules/subnet"

  enabled              = var.config.aks_node_subnet.enabled
  subnet_name          = var.config.aks_node_subnet.subnet_name
  subnet_cidr          = var.config.aks_node_subnet.subnet_cidr
  resource_group_name  = module.azure_resource_group.resource_group_name
  virtual_network_name = module.azure_virtual_network.azure_vnet_name
}

module "azure_aks_apiserver_subnet" {
  source = "../../../modules/subnet"

  enabled              = var.config.aks_apiserver_subnet.enabled
  subnet_name          = var.config.aks_apiserver_subnet.subnet_name
  subnet_cidr          = var.config.aks_apiserver_subnet.subnet_cidr
  resource_group_name  = module.azure_resource_group.resource_group_name
  virtual_network_name = module.azure_virtual_network.azure_vnet_name
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

module "azure_aks_virtualnode_subnet" {
  source = "../../../modules/subnet"

  enabled              = var.config.aks_virtualnode_subnet.enabled
  subnet_name          = var.config.aks_virtualnode_subnet.subnet_name
  subnet_cidr          = var.config.aks_virtualnode_subnet.subnet_cidr
  resource_group_name  = module.azure_resource_group.resource_group_name
  virtual_network_name = module.azure_virtual_network.azure_vnet_name
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
