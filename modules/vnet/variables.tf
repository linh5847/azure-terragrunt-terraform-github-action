# variable "vnet" {
#   description = "specifies an iteration for an Azure Virtual-Network resource"
#   type = map(object({
#     created             = bool
#     vnet_name           = string
#     location            = string
#     resource_group_name = string
#     vnet_address_space  = list(string)
#   }))
# }

variable "enabled" {
  description = "specifies whether to create VNET or not"
  type        = bool
  default     = false
}

variable "vnet_name" {
  description = "specifes an Azure Virtual-Network name"
  type        = string
  default     = ""
}

variable "location" {
  description = "specifies an Azure location/Region"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "specifies an Azure Resource-Group name"
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  description = "specifies an Azure Virtual-Network address space"
  type        = list(string)
  default     = []
}

variable "additional_tags" {
  description = "add extra tags"
  type        = map(string)
  default     = {}
}