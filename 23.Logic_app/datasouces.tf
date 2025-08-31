data "azurerm_storage_account" "tushar_storage_account_data" {
    for_each = var.tushar_stgsvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}

data "azurerm_service_plan" "tushar_service-plandata" {
  for_each = var.tushar_service_planvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}