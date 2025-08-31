data "azurerm_subnet" "tushar_subnet_data" {
  for_each = var.tushar_subnetsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_key_vault" "tushar_keyvault_data" {
  for_each = var.tushar_KeyvaultsVars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "tushar_passworddata" {
    for_each = var.tushar_randompasswordsvars
    name = "${each.value.name}-secretpass"
    key_vault_id = data.azurerm_key_vault.tushar_keyvault_data[each.value.keyvault_name].id
}