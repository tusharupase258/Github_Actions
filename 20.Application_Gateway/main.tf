resource "azurerm_application_gateway" "tushar_appgateways" {
  for_each = var.tushar_appgatewaysvars
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  sku {
    name = each.value.sku_name
    tier = each.value.tier
    capacity = each.value.capacity
  }
  gateway_ip_configuration {
    name = each.value.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.tushar_subnetdata[each.value.subnet_name].id
  }
  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }
  frontend_ip_configuration {
    name = each.value.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.tushar_publicipdata[each.value.publicip_name].id
  }
  backend_address_pool {
    name = each.value.backend_address_pool_name
    ip_addresses = [
    for nic in data.azurerm_network_interface.tushar_nicdata :
    nic.private_ip_address
  ]
  }
  backend_http_settings {
    name = each.value.backend_http_settings_name
    port = each.value.backend_http_settings_port
    cookie_based_affinity = each.value.cookie_based_affinity
    protocol = each.value.backend_http_settings_protocol
  }
  http_listener {
    name = each.value.http_listener_name
    frontend_port_name = each.value.frontend_port_name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    protocol = each.value.http_listener_protocol
  }
  request_routing_rule {
    name = each.value.request_routing_rule_name
    rule_type = each.value.rule_type
    http_listener_name = each.value.http_listener_name
    backend_address_pool_name = each.value.backend_address_pool_name
    backend_http_settings_name = each.value.backend_http_settings_name
    priority = each.value.priority
  }
}