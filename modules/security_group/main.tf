resource "azurerm_network_security_group" "netsecurity_group" {

  count               = var.enabled == true ? 1 : 0
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(
    {
      "Name" = format("%s", var.security_group_name)
    },
    var.additional_tags,
  )
}
