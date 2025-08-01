
variable "security_group_rules" {
  description = "specifies each object details within a loop"
  type = map(object({
    enabled                      = bool
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = string
    source_port_ranges           = list(string)
    destination_port_range       = string
    destination_port_ranges      = list(string)
    source_address_prefix        = string
    source_address_prefixes      = list(string)
    destination_address_prefix   = string
    destination_address_prefixes = list(string)
    resource_group_name          = string
    network_security_group_name  = string
  }))
}
