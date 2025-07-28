resource "azurerm_resource_group" "rg" {
  # Optional
  # for_each = {
  #   for k, v in var.resource_group : k => v if v.created == true
  # }
  count    = var.enabled == true ? 1 : 0
  name     = var.resource_group_name
  location = var.location

  tags = merge(
    {
      "Name" = format("%s", var.resource_group_name)
    },
    var.additional_tags,
  )
}