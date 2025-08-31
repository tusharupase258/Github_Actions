resource "azurerm_windows_virtual_machine_scale_set" "tushar_winvmss" {
  for_each = var.tushar_winvmssvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  admin_username = each.value.name
  admin_password = data.azurerm_key_vault_secret.tushar_passworddata[each.value.name].value
  sku = each.value.sku
  instances = each.value.instances
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    version = "latest"
    sku = "2016-Datacenter-Server-Core"
  }
  network_interface {
    name = each.value.nic_name
    primary = true
    ip_configuration {
        name = each.value.ipconfig_name_winvmss
        subnet_id = data.azurerm_subnet.tushar_subnet_data[each.value.subnet_name].id
        primary = true
    }
  }
}