resource "azurerm_public_ip" "tushar_publicips" {
    for_each = var.tushar_publicipsvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    allocation_method = each.value.allocation_method
}