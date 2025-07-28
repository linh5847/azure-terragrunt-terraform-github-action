variable "environment" {
  description = "specifies an environment name"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Add extra tags"
  type        = map(string)
  default     = {}
}

variable "aks_agents_tags" {
  description = "Add extra tags"
  type        = map(string)
  default     = {}
}

variable "config" {
  description = "specifies an Azure resource-group name"
  type = object({
    resource_group = object({
      enabled             = bool
      resource_group_name = string
      location            = string
    }),
    virtual_network = object({
      enabled            = bool
      vnet_name          = string
      vnet_address_space = list(string)
    }),
    aks_node_subnet = object({
      enabled     = bool
      subnet_name = string
      subnet_cidr = list(string)
    }),
    aks_apiserver_subnet = object({
      enabled                   = bool
      subnet_name               = string
      subnet_cidr               = list(string)
      subnet_delegation_enabled = bool
      delegation_name           = string
      service_delegation_name   = string
      actions                   = list(string)
    }),
    aks_virtualnode_subnet = object({
      enabled                   = bool
      subnet_name               = string
      subnet_cidr               = list(string)
      subnet_delegation_enabled = bool
      delegation_name           = string
      service_delegation_name   = string
      actions                   = list(string)
    })
  })
}
