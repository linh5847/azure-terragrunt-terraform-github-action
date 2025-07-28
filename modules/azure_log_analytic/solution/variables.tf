variable "log_analytics_solution_enabled" {
  description = "specifies whether to create this resource or not"
  type        = bool
  default     = false
}

variable "location" {
  description = "specifies an Azure location/Region"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "specifies an Azure resource-group"
  type        = string
  default     = ""
}

variable "solution_name" {
  description = "specifies an Azure-log-analytic-solution name"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_name" {
  description = "specifies an Azure-log-analytic-workspace name"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "specifies an Azure log-analytic-workspace ID"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Add extra tags"
  type        = map(string)
  default     = {}
}