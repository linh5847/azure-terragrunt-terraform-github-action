resource "azurerm_virtual_network" "vnet" {
  # Optional
  # for_each = {
  #   for k, v in var.vnet : k => v if v.created == true
  # }
  count = var.enabled == true ? 1 : 0

  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space

  tags = merge(
    {
      "Name" = format("%s", var.vnet_name)
    },
    var.additional_tags,
  )
}