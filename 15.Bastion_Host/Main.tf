resource "azurerm_bastion_host" "tushar_bastionhosts" {
  for_each = var.tusharbastionvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  ip_configuration {
    name = each.value.ipconfigname_bastion
    subnet_id = data.azurerm_subnet.tushar_subnetdata[each.key].id
    public_ip_address_id = data.azurerm_public_ip.tushar_publicipdata[each.key].id
  }
}