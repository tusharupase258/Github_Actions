resource "azurerm_linux_virtual_machine" "tushar_vms" {
  for_each = var.tushar_vmsvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  size = each.value.size
  admin_username = each.value.name
  admin_password = data.azurerm_key_vault_secret.tushar_passworddata[each.value.name].value
  disable_password_authentication = false
  network_interface_ids = [ data.azurerm_network_interface.tushar_nicsdata[each.value.nic_name].id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
  custom_data = filebase64("${path.module}/customdata.sh")
}