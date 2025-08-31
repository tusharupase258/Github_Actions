resource "azurerm_subnet" "tushar_subnets" {
  for_each = var.tushar_subnetsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = each.value.address_prefixes
}