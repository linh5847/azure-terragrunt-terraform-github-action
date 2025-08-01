
resource "azurerm_network_security_rule" "security_group_rule" {
  for_each = { for k, v in var.security_group_rules : k => v if v.enabled == true }

  name                         = each.value.name
  priority                     = each.value.priority
  direction                    = each.value.direction
  access                       = each.value.access
  protocol                     = each.value.protocol
  source_port_range            = length(each.value.source_port_ranges) == 1 ? each.value.source_port_ranges[0] : null
  source_port_ranges           = length(each.value.source_port_ranges) != 1 ? each.value.source_port_ranges : null
  destination_port_range       = length(each.value.destination_port_ranges) == 1 ? each.value.destination_port_ranges[0] : null
  destination_port_ranges      = length(each.value.destination_port_ranges) != 1 ? each.value.destination_port_ranges : null
  source_address_prefix        = length(each.value.source_address_prefixes) == 1 ? each.value.source_address_prefixes[0] : null
  source_address_prefixes      = length(each.value.source_address_prefixes) != 1 ? each.value.source_address_prefixes : null
  destination_address_prefix   = length(each.value.destination_address_prefixes) == 1 ? each.value.destination_address_prefixes[0] : null
  destination_address_prefixes = length(each.value.destination_address_prefixes) != 1 ? each.value.destination_address_prefixes : null
  resource_group_name          = each.value.resource_group_name
  network_security_group_name  = each.value.network_security_group_name
}
