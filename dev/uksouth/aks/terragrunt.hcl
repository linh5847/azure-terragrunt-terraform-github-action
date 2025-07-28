include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  project_name = local.global_vars.locals.project_name
}

inputs = {
  environment = "dev"

  additional_tags = {
    Project = "INFRA"
    Cost    = "INFRA"
    Service = "Azure"
  }

  aks_agents_tags = {
    "iac"         = "Terraform"
    "resource"    = "nodepool"
    "servicemesh" = "Istio"
  }

  config = {
    resource_group = {
      enabled             = true
      resource_group_name = "dev-resource-group"
      location            = "uksouth"
    },
    virtual_network = {
      enabled            = true
      vnet_name          = "dev-vnet"
      vnet_address_space = ["10.10.0.0/16"]
    },
    aks_node_subnet = {
      enabled     = true
      subnet_name = "dev-aks-node-subnet"
      subnet_cidr = ["10.10.32.0/21", "10.10.40.0/21", "10.10.48.0/21", "10.10.56.0/21"]
    },
    aks_apiserver_subnet = {
      enabled                   = true
      subnet_name               = "dev-aks-apiserver-subnet"
      subnet_cidr               = ["10.10.72.0/21"]
      subnet_delegation_enabled = true
      delegation_name           = "aks-apiserver-delegation"
      service_delegation_name   = "Microsoft.ContainerService/managedClusters"
      actions                   = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    },
    aks_virtualnode_subnet = {
      enabled                   = true
      subnet_name               = "dev-aks-vnode-subnet"
      subnet_cidr               = ["10.10.88.0/21"]
      subnet_delegation_enabled = true
      delegation_name           = "aks-virtualNode-delegation"
      service_delegation_name   = "Microsoft.ContainerInstance/containerGroups"
      actions                   = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}