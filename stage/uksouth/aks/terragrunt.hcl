include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  project_name = local.global_vars.locals.project_name
}

inputs = {
  environment = "stage"

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
      resource_group_name = "stage-resource-group"
      location            = "uksouth"
    },
    virtual_network = {
      enabled            = true
      vnet_name          = "stage-vnet"
      vnet_address_space = ["10.20.0.0/16"]
    },
    aks_node_subnet = {
      enabled     = true
      subnet_name = "stage-aks-node-subnet"
      subnet_cidr = ["10.20.32.0/21", "10.20.40.0/21", "10.20.48.0/21", "10.20.56.0/21"]
    },
    aks_apiserver_subnet = {
      enabled                   = true
      subnet_name               = "stage-aks-apiserver-subnet"
      subnet_cidr               = ["10.20.72.0/21"]
      subnet_delegation_enabled = true
      delegation_name           = "aks-apiserver-delegation"
      service_delegation_name   = "Microsoft.ContainerService/managedClusters"
      actions                   = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    },
    aks_virtualnode_subnet = {
      enabled                   = true
      subnet_name               = "stage-aks-vnode-subnet"
      subnet_cidr               = ["10.20.88.0/21"]
      subnet_delegation_enabled = true
      delegation_name           = "aks-virtualNode-delegation"
      service_delegation_name   = "Microsoft.ContainerInstance/containerGroups"
      actions                   = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}