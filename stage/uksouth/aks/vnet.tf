module "azure-virtual-network" {
  source = "../../../modules/vnet"

  enabled             = var.config.virtual_network.enabled
  vnet_name           = var.config.virtual_network.vnet_name
  location            = module.azure-resource-group.resource_group_location[0]
  resource_group_name = module.azure-resource-group.resource_group_name[0]
  vnet_address_space  = var.config.virtual_network.vnet_address_space
  additional_tags     = var.additional_tags
}
