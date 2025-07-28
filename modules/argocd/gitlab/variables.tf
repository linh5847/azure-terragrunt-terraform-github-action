variable "k8s_name" {
  description = "specifies a kubernetes cluster name"
  type        = string
  default     = ""
}

variable "k8s_version" {
  description = "specifies a kubernetes release stable version"
  type        = string
  default     = ""
}

variable "k8s_node_label" {
  description = "specifies a k8s-node label fo nodeselector or nodeaffinity"
  type        = string
  default     = ""
}

variable "k8s_extra_node_label" {
  description = "specifies a k8s-node label on different node"
  type        = string
  default     = ""
}

variable "gitlab_group" {
  description = "specifies a gitlab group and subgroup names"
  type        = string
  default     = ""
}

variable "gitlab_project" {
  description = "specifies a gitlab project name"
  type        = string
  default     = ""
}

variable "gitlab_token" {
  description = "specifies a gitlab personal access token"
  type        = string
  default     = ""
}