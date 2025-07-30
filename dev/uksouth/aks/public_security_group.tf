module "public-security-group" {
  depends_on = [module.azure-aks-virtualnode-subnet]
  source     = "../../../modules/security_group"

  enabled             = var.config.public_security_group.enabled
  security_group_name = var.config.public_security_group.security_group_name
  location            = module.azure-resource-group.resource_group_location[0]
  resource_group_name = module.azure-resource-group.resource_group_name[0]
  additional_tags     = var.additional_tags
}
