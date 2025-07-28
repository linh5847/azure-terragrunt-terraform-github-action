variable "host" {
  description = "specifies a kubernetes host endpoint for helm provider"
  type        = string
  default     = ""
}

variable "cluster_ca_certificate" {
  description = "specifies a kubernetes cluster-ca-certificate for helm provider"
  type        = string
  default     = ""
}

variable "client_certificate" {
  description = "specifies a kubernetes client-certificate for helm provider"
  type        = string
  default     = ""
}

variable "client_key" {
  description = "specifies a kubernetes client-key for helm provider"
  type        = string
  default     = ""
}

variable "name" {
  description = "specifies a helm-release name"
  type        = string
  default     = ""
}

variable "repository" {
  description = "specifies a helm-release product repository url link"
  type        = string
  default     = ""
}

variable "chart" {
  description = "specifies a helm-release chart name"
  type        = string
  default     = ""
}

variable "chart_version" {
  description = "specifies a helm-release chart version"
  type        = string
  default     = ""
}

variable "upgrade_install" {
  description = "specifies whether helm_release upgrade-install or not"
  type        = bool
  default     = true
}

variable "force_update" {
  description = "specifies whether to force helm_chart update or not"
  type        = bool
  default     = true
}

variable "skip_crds" {
  description = "specifies whether helm-release to skip CRDs or not"
  type        = bool
  default     = false
}

variable "lint" {
  description = "specifies whether to running the check before install or not"
  type        = bool
  default     = true
}

variable "max_history" {
  description = "specifies a number of helm-release cache history"
  type        = number
  default     = 0 //unlimited
}

variable "cleanup_on_fail" {
  description = "specifies whether helm-release chart cleanup-on-fail or not"
  type        = bool
  default     = true
}

variable "create_namespace" {
  description = "specifies whether to create-namespace or not"
  type        = bool
  default     = false
}

variable "namespace" {
  description = "specifies a k8s namespace"
  type        = string
  default     = ""
}

variable "timeout" {
  description = "specifies timeout"
  type        = number
  default     = 180
}

variable "values" {
  description = "Extra values"
  type        = list(string)
  default     = []
}

variable "set" {
  description = "specifies a dynamic objects in a form of name and value"
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}

variable "set_list" {
  description = "specifies a dynamic objects in a form of name and value"
  type = list(object({
    name  = string
    value = list(string)
  }))
  default = []
}

variable "set_sensitive" {
  description = "specifies a dynamic objects in a form of name and value"
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}

