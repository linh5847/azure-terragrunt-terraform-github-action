variable "byte_length" {
  type        = number
  default     = 16
  description = "specifies a random-pet byte length"
}

variable "keyvault_enabled" {
  description = "specifies whether to create the resource or not"
  type        = bool
  default     = false
}

variable "keyvault_name" {
  description = "specifies an Azure KeyVault name"
  type        = string
  default     = ""
}

variable "location" {
  type        = string
  default     = ""
  description = "specifies an Azure location/region"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "specifies an Azure resource-group name"
}

variable "keyvault_sku_name" {
  type        = string
  default     = "standard"
  description = "specifies an Azure KeyVault sku-name"

  validation {
    condition     = contains(["standard", "premium"], var.keyvault_sku_name)
    error_message = "Must be either 'standard' or 'premium' only."
  }
}

variable "keyvault_certificate_permissions" {
  type        = list(string)
  default     = []
  description = "specifies a list of an  Azure-keyvault-certificate-permission"
}

variable "keyvault_key_permissions" {
  description = "List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  type        = list(any)
  default     = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
}

variable "keyvault_secret_permissions" {
  description = "List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  type        = list(string)
  default     = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
}

variable "keyvault_storage_permissions" {
  description = "List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
  type        = list(string)
  default     = ["backup", "deleteas", "delete", "getas", "get", "listas", "list", "purge", "recover", "restore", "regeneratekey", "set", "setas", "update"]
}

variable "enabled_for_disk_encryption" {
  type        = bool
  default     = true
  description = "specifies whether to enable-for-disk-encryption or not"
}

variable "enabled_for_deployment" {
  type        = bool
  default     = true
  description = "specifies whether to enable-for-deployment or not"
}

variable "enabled_for_template_deployment" {
  type        = bool
  default     = true
  description = "specifies whether to enable-for-template-deployment or not"
}

variable "purge_protection_enabled" {
  type        = bool
  default     = true
  description = "specifies whether to enable purge-protection or not"
}

variable "users" {
  description = "Object IDs of Users that will have access to the key vault"
  type = list(object({
    user_id = string
    admin   = bool
  }))
  default = []
}

# User permissions
variable "user_key_permissions" {
  type        = list(any)
  description = "List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  default     = ["list", "get", "decrypt", "unwrapKey"]
}

variable "user_secret_permissions" {
  type        = list(any)
  description = "List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  default     = ["list", "get"]
}

variable "user_storage_permissions" {
  type        = list(any)
  description = "List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
  default     = ["list", "get", "listas", "getsas"]
}

variable "network_acls_default_action" {
  type        = string
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
  default     = "Deny"
}

variable "network_acls_bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  default     = null
}

variable "network_acls_ip_rules" {
  default     = null
  type        = list(string)
  description = "(Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
}

variable "network_acls_subnet_ids" {
  default     = null
  type        = list(string)
  description = "(Optional) One or more Subnet ID's which should be able to access this Key Vault."
}

variable "secrets" {
  description = "List of secrets for be created"
  default     = {}
}

variable "additional_tags" {
  description = "Add extra tags"
  type        = map(string)
  default     = {}
}