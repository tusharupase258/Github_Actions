resource "azurerm_storage_account" "tushar_stgs" {
    for_each = var.tushar_stgsvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type
}