variable "keyvault_certificate_enabled" {
  description = "specifies whether to create the resource or not"
  type        = bool
  default     = false
}

variable "keyvault_certificate_name" {
  type        = string
  default     = ""
  description = "specifies an Azure-keyvault certificate name"
}

variable "keyvault_id" {
  type        = string
  default     = ""
  description = "specifies an Azure KeyVault ID"
}

variable "keyvault_certificate_issuer_name" {
  type        = string
  default     = "self"
  description = "specifies an Azure KeyVault-certificate issuer-name"
}

variable "keyvault_certificate_exportable" {
  type        = bool
  default     = true
  description = "specifies whether to enable the certificate exportable or not"
}

variable "keyvault_certificate_keysize" {
  type        = number
  default     = 2048
  description = "define an Azure KeyVault-Certificate key size"
}

variable "keyvault_certificate_keytype" {
  type        = string
  default     = "RSA"
  description = "specifies an Azure KeyVault-certificate key type"
}

variable "keyvault_certificate_reusekey" {
  type        = bool
  default     = false
  description = "specifies whether to reuse key or not"
}

variable "keyvault_certificate_actiontype" {
  type        = string
  default     = "AutoRenew"
  description = "specifies an Azure KeyVault-certificate action type"

  validation {
    condition     = contains(["AutoRenew", "EmailContacts"], var.keyvault_certificate_actiontype)
    error_message = "Must be either 'AutoRenew' or 'EmailContacts' only."
  }
}

variable "keyvault_certificate_days_before_expiry" {
  type        = number
  default     = 30
  description = "specifies an Azure KeyVault-certificate expiry day"
}

variable "keyvault_certificate_content_type" {
  type        = string
  default     = "application/x-pkcs12"
  description = "specifies an Azure KeyVault-certificate content type"

  validation {
    condition     = contains(["application/x-pkcs12", "application/x-pem-file"], var.keyvault_certificate_content_type)
    error_message = "Must be either 'application/x-pkcs12' or 'application/x-pem-file' only"
  }
}

variable "keyvault_certificate_extended_key_usage" {
  type        = list(string)
  default     = []
  description = "specifies a list of an Azure KeyVault-certificate extended-key-usage"
}

variable "keyvault_certificate_keyusage" {
  type        = list(string)
  default     = ["cRLSign", "dataEncipherment", "digitalSignature", "keyAgreement", "keyCertSign", "keyEncipherment", ]
  description = "specifes a list of an Azure KeyVault-certificate key usage"
}

variable "keyvault_certificate_dns_names" {
  type        = list(string)
  default     = []
  description = "specifies a list of an Azure KeyVault-certificate dns names"
}

variable "keyvault_certificate_subject" {
  type        = string
  default     = ""
  description = "specifies an Azure KeyVault-certificate subject"
}

variable "keyvault_certificate_validity_in_months" {
  type        = number
  default     = 12
  description = "specifies an Azure KeyVault-certificate validation in month ie 12 months"
}

variable "certificate_base64_encoded" {
  description = "specifies a certificate base64 encoded format pfx"
  type        = string
  default     = ""
}

variable "certificate_password" {
  description = "specifies a PFX format certificate password"
  type        = string
  default     = ""
}
