resource "azurerm_application_gateway" "tushar_appgateways" {
  for_each            = var.tushar_appgateways
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = each.value.sku_name
    tier     = each.value.tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.subnets[each.key].id
  }

  dynamic "frontend_port" {
    for_each = each.value.frontend_ports
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configurations
    content {
      name                 = frontend_ip_configuration.value.name
      public_ip_address_id = data.azurerm_public_ip.publicips["${each.key}-${frontend_ip_configuration.value.name}"].id
    }
  }

  dynamic "backend_address_pool" {
    for_each = {
      for pool in each.value.backend_address_pools :
      pool.name => [
        for idx, nic_name in pool.nic_names :
        data.azurerm_network_interface.nics["${each.key}-${pool.name}-${nic_name}"].private_ip_address
      ]
    }
    content {
      name         = backend_address_pool.key
      ip_addresses = backend_address_pool.value
    }
  }

  dynamic "backend_http_settings" {
    for_each = each.value.backend_http_settings
    content {
      name                  = backend_http_settings.value.name
      port                  = backend_http_settings.value.port
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      protocol              = backend_http_settings.value.protocol
    }
  }

  dynamic "http_listener" {
    for_each = each.value.http_listeners
    content {
      name                           = http_listener.value.name
      frontend_port_name             = http_listener.value.frontend_port_name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      protocol                       = http_listener.value.protocol
    }
  }

  dynamic "request_routing_rule" {
    for_each = each.value.request_routing_rules
    content {
      name                       = request_routing_rule.value.name
      rule_type                  = request_routing_rule.value.rule_type
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
      priority                   = request_routing_rule.value.priority
    }
  }
}
