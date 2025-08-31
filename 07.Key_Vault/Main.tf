resource "azurerm_key_vault" "tushar_keyvaults" {
  for_each = var.tushar_KeyvaultsVars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  tenant_id = data.azurerm_client_config.tushar_clientconfig_data.tenant_id
  sku_name = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.tushar_clientconfig_data.tenant_id
    object_id = data.azurerm_client_config.tushar_clientconfig_data.object_id
    key_permissions = [
       "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
    ]
    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]
    storage_permissions = [
      "Backup", "Delete", "DeleteSAS", "Get", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
    ]
  }
}