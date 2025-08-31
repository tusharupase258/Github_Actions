resource "azurerm_storage_container" "tushar_containers" {
  for_each = var.tushar_containersvars
  name = each.value.name
  storage_account_id = data.azurerm_storage_account.tushar_storagedata[each.value.storage_account_name].id
  container_access_type = each.value.container_access_type
}