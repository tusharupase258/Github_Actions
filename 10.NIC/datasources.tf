data "azurerm_public_ip" "tushar_publicip_data" {
  for_each = var.tushar_publicipsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "tushar_subnet_data" {
  for_each = var.tushar_subnetsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

# data "azurerm_network_security_group" "tusharnsgdata" {
#   for_each = var.tusharnsgvars
#   name = each.value.name
#   resource_group_name = each.value.resource_group_name
# }