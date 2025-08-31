resource "random_password" "tushar_passwords" {
    for_each = var.tushar_randompasswordsvars
    length = 16
    special = true
    override_special = "!#$%&*()-_=+[]{}<>:?"
    lifecycle {
      prevent_destroy = true
      create_before_destroy = true
    }
}

resource "azurerm_key_vault_secret" "tushar_secrets" {
  for_each = var.tushar_randompasswordsvars
  name = "${each.value.name}-secretpass"
  key_vault_id = data.azurerm_key_vault.tushar_kvdata[each.value.keyvault_name].id
  value = random_password.tushar_passwords[each.key].result
  lifecycle {
      prevent_destroy = true
      create_before_destroy = true
    }
}