resource "azurerm_key_vault_certificate" "keycert" {
  count        = var.keyvault_certificate_enabled == true ? 1 : 0
  name         = var.keyvault_certificate_name
  key_vault_id = var.keyvault_id

  certificate {
    contents = var.certificate_base64_encoded
    password = var.certificate_password
  }

  certificate_policy {
    issuer_parameters {
      name = var.keyvault_certificate_issuer_name
    }

    key_properties {
      exportable = var.keyvault_certificate_exportable
      key_size   = var.keyvault_certificate_keysize
      key_type   = var.keyvault_certificate_keytype
      reuse_key  = var.keyvault_certificate_reusekey
    }

    lifetime_action {
      action {
        action_type = var.keyvault_certificate_actiontype
      }

      trigger {
        days_before_expiry = var.keyvault_certificate_days_before_expiry
      }
    }

    secret_properties {
      content_type = var.keyvault_certificate_content_type
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = var.keyvault_certificate_extended_key_usage

      key_usage = var.keyvault_certificate_keyusage

      subject_alternative_names {
        dns_names = var.keyvault_certificate_dns_names
      }

      subject            = var.keyvault_certificate_subject
      validity_in_months = var.keyvault_certificate_validity_in_months
    }
  }
}