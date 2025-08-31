resource"azurerm_windows_virtual_machine""tushar_windowsvms"{
    for_each = var.tushar_windowsvmsvar
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.size
    admin_username = each.value.name
    admin_password = data.azurerm_key_vault_secret.tushar_passworddata[each.value.name].value
    network_interface_ids = [ data.azurerm_network_interface.tushar_nicsdata[each.value.nic_name].id]
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2016-Datacenter"
      version = "latest"
    }
}

resource "azurerm_virtual_machine_extension" "tushar_custom_script" {
  for_each             = var.tushar_windowsvmsvar
  name                 = "windows-vm-init-${each.key}"
  virtual_machine_id   = azurerm_windows_virtual_machine.tushar_windowsvms[each.key].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = jsonencode({
    fileUris = []
  })

protected_settings = jsonencode({
  commandToExecute = "powershell -ExecutionPolicy Unrestricted -Command \"${replace(file("${path.module}/customdata.ps1"), "\"", "\\\"")}\""
})
}
