data "azurerm_subnet" "tushar_subnetdata" {
  for_each = var.tushar_subnetsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "tushar_publicipdata" {
    for_each = var.tushar_publicipsvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "tushar_nicdata" {
  for_each = var.tusharnic_vars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}