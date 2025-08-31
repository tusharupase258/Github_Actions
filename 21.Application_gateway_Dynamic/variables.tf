variable "tushar_appgateways" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    sku_name                    = string
    tier                        = string
    capacity                    = number
    gateway_ip_configuration_name = string
    subnet_name                 = string
    subnet_rg                   = string
    vnet_name                   = string
    frontend_ports              = list(object({ name = string, port = number }))
    frontend_ip_configurations  = list(object({
      name          = string
      public_ip_name = string
      public_ip_rg   = string
    }))
    backend_address_pools       = list(object({
      name      = string
      nic_names = list(string)
      nic_rgs   = list(string)
    }))
    backend_http_settings       = list(object({
      name                  = string
      port                  = number
      cookie_based_affinity = string
      protocol              = string
    }))
    http_listeners             = list(object({
      name                           = string
      frontend_port_name             = string
      frontend_ip_configuration_name = string
      protocol                       = string
    }))
    request_routing_rules       = list(object({
      name                       = string
      rule_type                  = string
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string
      priority                   = number
    }))
  }))
}
