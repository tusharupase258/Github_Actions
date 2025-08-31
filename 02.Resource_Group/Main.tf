resource "azurerm_resource_group" "tushar_RGs" {
  for_each = var.tushar_RGvars
  name = each.value.name
  location = each.value.location
}