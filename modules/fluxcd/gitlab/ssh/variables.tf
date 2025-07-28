variable "gitlab_group" {
  description = "specifies a gitlab group and subgroup name"
  type        = string
  default     = ""
}

variable "gitlab_project" {
  description = "specifies a gitlab project name"
  type        = string
  default     = ""
}

variable "gitlab_token" {
  description = "specifies a gitlab personal-access-token"
  type        = string
  default     = ""
}

variable "flux_cluster_path" {
  description = "specifies a fluxcd-cluster directory for monitoring"
  type        = string
  default     = ""
}