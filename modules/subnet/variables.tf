variable "enabled" {
  description = "specifies whether subnet to be created or not"
  type        = bool
  default     = false
}

variable "subnet_cidr" {
  description = "specifies a list of subnets"
  type        = list(string)
  default     = []
}

variable "subnet_name" {
  description = "specifies an azure subnet name"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "specifies an azure resource-group name"
  type        = string
  default     = ""
}

variable "virtual_network_name" {
  description = "specifies an azure virtual-network name"
  type        = string
  default     = ""
}

# variable "subnet_delegation" {
#   description = "specifies each dynamic loop object details"
#   type = map(object({
#     subnet_delegation_enabled = bool
#     name                      = string
#     actions                   = list(string)
#   }))
#   default = {}
# }

variable "subnet_delegation" {
  type    = any
  default = {}
}