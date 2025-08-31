data "azurerm_network_interface" "tushar_nicsdata" {
  for_each = var.tusharnic_vars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
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