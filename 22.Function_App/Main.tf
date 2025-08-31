resource "azurerm_service_plan" "tushar_function_app_service_plan" {
  for_each = var.tushar_service_planvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  sku_name = each.value.sku_name
  os_type = each.value.os_type
}

# resource "azurerm_linux_function_app" "tushar_function_app" {
#     for_each = var.tushar_functionappvars
#     name = each.value.name
#     resource_group_name = each.value.resource_group_name
#     location = each.value.location
#     storage_account_name = each.value.storage_account_name
#     storage_account_access_key = data.azurerm_storage_account.tushar_storage_account_data[each.value.storage_account_name].primary_access_key
#     service_plan_id = azurerm_service_plan.tushar_function_app_service_plan[each.value.service_plan_name].id
#     site_config {
#     application_stack {
#       python_version = "3.10" # or node_version / dotnet_version
#     }
#   }
# }