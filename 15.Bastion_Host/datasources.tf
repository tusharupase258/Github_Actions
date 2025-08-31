data "azurerm_public_ip" "tushar_publicipdata" {
  for_each = var.tusharbastionvars
  name = each.value.publicip_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_subnet" "tushar_subnetdata" {
  for_each = var.tusharbastionvars
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}