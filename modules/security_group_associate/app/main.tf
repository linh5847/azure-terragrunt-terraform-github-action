resource "azurerm_network_interface_application_security_group_association" "nic_app_sec_association" {
  network_interface_id          = var.network_interface_id
  application_security_group_id = var.application_security_group_id
}
