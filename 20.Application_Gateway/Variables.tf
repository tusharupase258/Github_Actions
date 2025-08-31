variable "tushar_subnetsvars" {
  type = map(object({
    name = string
    resource_group_name = string
    virtual_network_name = string
  }))
}


variable "tushar_publicipsvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}

variable "tusharnic_vars" {
    type = map(object({
      name = string
      resource_group_name = string
    }))
}

variable "tushar_appgatewaysvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku_name = string
    tier = string
    capacity = number
    gateway_ip_configuration_name = string
    frontend_port_name = string
    frontend_port = number
    frontend_ip_configuration_name = string
    backend_address_pool_name = string
    backend_http_settings_name = string
    backend_http_settings_port = number
    cookie_based_affinity = string
    backend_http_settings_protocol = string
    http_listener_name = string
    http_listener_protocol = string
    request_routing_rule_name = string
    rule_type = string
    priority = number
    subnet_name = string
    publicip_name = string
  }))
}