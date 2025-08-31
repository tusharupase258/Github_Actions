# resource "azurerm_container_registry" "tushar_acrs" {
#   for_each = var.tushar_acrvars
#   name = each.value.name
#   location = each.value.location
#   resource_group_name = each.value.resource_group_name
#   sku = each.value.sku
#   admin_enabled = false
# }