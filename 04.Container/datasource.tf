data "azurerm_storage_account" "tushar_storagedata" {
  for_each = var.tushar_stgsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}