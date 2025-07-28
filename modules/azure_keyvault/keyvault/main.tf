data "azurerm_client_config" "current" {}

resource "random_id" "server" {
  keepers = {
    ami_id = 1
  }

  byte_length = var.byte_length
}

resource "azurerm_key_vault" "keyvault" {
  count = var.keyvault_enabled == true ? 1 : 0

  name                = format("%s%s", "${var.keyvault_name}", random_id.server.hex)
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = var.keyvault_sku_name

  # Access policy for service principal running the terraform script
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = var.keyvault_certificate_permissions
    key_permissions         = var.keyvault_key_permissions
    secret_permissions      = var.keyvault_secret_permissions
    storage_permissions     = var.keyvault_storage_permissions
  }

  # access policy for defined users
  dynamic "access_policy" {

    for_each = var.users
    content {
      tenant_id = data.azurerm_client_config.current_client_config.tenant_id
      object_id = access_policy.value.user_id

      key_permissions     = access_policy.value.admin ? var.admin_key_permissions : var.user_key_permissions
      secret_permissions  = access_policy.value.admin ? var.admin_secret_permissions : var.user_secret_permissions
      storage_permissions = access_policy.value.admin ? var.admin_storage_permissions : var.user_storage_permissions
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls_bypass == null ? [] : ["acls"]

    content {
      default_action             = var.network_acls_default_action
      bypass                     = var.network_acls_bypass
      ip_rules                   = var.network_acls_ip_rules
      virtual_network_subnet_ids = var.network_acls_subnet_ids
    }
  }

  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  purge_protection_enabled        = var.purge_protection_enabled

  tags = merge(
    {
      "Name" = format("%s%s", "${var.keyvault_name}", random_id.server.hex)
    },
    var.additional_tags,
  )

}