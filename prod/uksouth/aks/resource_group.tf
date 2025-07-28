module "azure-resource-group" {
  source = "../../../modules/resource_group"

  enabled             = var.config.resource_group.enabled
  resource_group_name = var.config.resource_group.resource_group_name
  location            = var.config.resource_group.location
  additional_tags     = var.additional_tags
}
