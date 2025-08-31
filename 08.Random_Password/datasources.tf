data "azurerm_key_vault" "tushar_kvdata" {
    for_each = var.tushar_KeyvaultsVars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}