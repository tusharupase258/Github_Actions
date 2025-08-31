resource "azurerm_network_interface" "tushar_nics" {
  for_each = var.tusharnic_vars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  ip_configuration {
    name = each.value.ip_configuration_name
    # public_ip_address_id = data.azurerm_public_ip.tushar_publicip_data[each.value.publicip_name].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    subnet_id = data.azurerm_subnet.tushar_subnet_data[each.value.subnet_name].id
  }
}

# resource "azurerm_network_interface_security_group_association" "tusharnicplusnsg" {
#   for_each = var.tusharnic_vars
#   network_interface_id = azurerm_network_interface.tushar_nics[each.key].id
#   network_security_group_id = data.azurerm_network_security_group.tusharnsgdata[each.value.nsg_name].id
# }