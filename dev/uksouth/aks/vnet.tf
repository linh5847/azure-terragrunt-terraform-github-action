module "azure_virtual_network" {
  source = "../../../modules/vnet"

  enabled             = var.config.virtual_network.enabled
  vnet_name           = var.config.virtual_network.vnet_name
  location            = module.azure_resource_group.resource_group_location
  resource_group_name = module.azure_resource_group.resource_group_name
  vnet_address_space  = var.config.virtual_network.vnet_address_space
  additional_tags     = var.additional_tags
}
