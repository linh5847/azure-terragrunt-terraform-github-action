variable "enabled" {
  description = "specifies whether to create this resource or not"
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "specifies an Azure network security-group name"
  type        = string
  default     = ""
}

variable "location" {
  description = "specifies Azure region location"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "specifies Azure resource-group name"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "add extra tags"
  type        = map(string)
  default     = {}
}
