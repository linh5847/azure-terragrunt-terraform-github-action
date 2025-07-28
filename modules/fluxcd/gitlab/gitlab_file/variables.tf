variable "file_path" {
  description = "specifiies a file path name"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "specifies a gitlab-project-file name"
  type        = string
  default     = ""
}

variable "flux_cluster_path" {
  description = "specifies a fluxcd-cluster-path"
  type        = string
  default     = ""
}

variable "gitlab_token" {
  description = "specifies a gitlab-token"
  type        = string
  default     = ""
}