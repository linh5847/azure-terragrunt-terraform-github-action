variable "log_analytics_workspace_enabled" {
  description = "specifies whether to create an Azure log-analytic-workspace resource or not"
  type        = bool
  default     = false
}

variable "location" {
  description = "specifies an Azure location/region"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "specifies an Azure resource-group name"
  type        = string
  default     = ""
}

variable "cluster_log_analytics_workspace_name" {
  type        = string
  default     = null
  description = "(Optional) The name of the Analytics workspace"
}

variable "log_retention_in_days" {
  type        = number
  default     = 30
  description = "The retention period for the logs in days"
}

variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"

  validation {
    condition     = contains(["Free", "PerNode", "Premium", "Standard", "Standalone", "Unlimited", "CapacityReservation", "PerGB2018"], var.log_analytics_workspace_sku)
    error_message = "Must be one of these 'Free', 'PerNode', 'Premium', 'Standard', 'Standalone', 'Unlimited', 'CapacityReservation', 'PerGB2018'"
  }
}

variable "additional_tags" {
  description = "Add extra tags"
  type        = map(string)
  default     = {}
}