module "public_security_group" {
  source = "../../../modules/security_group"

  enabled             = var.config.public_security_group.enabled
  security_group_name = var.config.public_security_group.security_group_name
  location            = module.azure_resource_group.resource_group_location
  resource_group_name = module.azure_resource_group.resource_group_name
  additional_tags     = var.additional_tags
}

module "public_security_group_rules" {
  source = "../../../modules/security_group_rule"

  security_group_rules = {
    "public_outbound" = {
      enabled                      = var.config.public_security_group_rule.enabled
      name                         = var.config.public_security_group_rule.name
      priority                     = var.config.public_security_group_rule.priority
      direction                    = var.config.public_security_group_rule.direction
      access                       = var.config.public_security_group_rule.access
      protocol                     = var.config.public_security_group_rule.protocol
      source_port_range            = var.config.public_security_group_rule.source_port_range
      source_port_ranges           = var.config.public_security_group_rule.source_port_ranges
      destination_port_range       = var.config.public_security_group_rule.destination_port_range
      destination_port_ranges      = var.config.public_security_group_rule.destination_port_ranges
      source_address_prefix        = var.config.public_security_group_rule.source_address_prefix
      source_address_prefixes      = var.config.public_security_group_rule.source_address_prefixes
      destination_address_prefix   = var.config.public_security_group_rule.destination_address_prefix
      destination_address_prefixes = var.config.public_security_group_rule.destination_address_prefixes
      resource_group_name          = module.azure_resource_group.resource_group_name
      network_security_group_name  = module.public_security_group.security_group_name
    }
  }
}
