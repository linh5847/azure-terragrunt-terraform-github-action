# variable "resource_group" {
#   description = "specifies an iteration for azure resource-group"
#   type = map(object({
#     created             = bool
#     resource_group_name = string
#     location            = string
#   }))
# }

variable "enabled" {
  description = "specifies whether to create this resource or not"
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "specifies an Azure Resource-Group name"
  type        = string
  default     = ""
}

variable "location" {
  description = "specifies an Azure location or region"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "add extra tags"
  type        = map(string)
  default     = {}
}