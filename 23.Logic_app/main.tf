resource "azurerm_logic_app_standard" "tushar_logicapp_standard" {
  for_each = var.tushar_logicapp_standardvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  storage_account_name = each.value.storage_account_name
  storage_account_access_key = data.azurerm_storage_account.tushar_storage_account_data[each.value.storage_account_name].primary_access_key
  app_service_plan_id = data.azurerm_service_plan.tushar_service-plandata[each.value.app_service_plan_name].id
}