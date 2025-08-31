data "azurerm_public_ip" "tushar_publicip_data" {
  for_each = var.tushar_publicipsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_network" "tushar_vnetdata" {
    for_each = var.tushar_vnetvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_machine" "tushar_vmdata" {
    for_each = var.tushar_vmsvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}