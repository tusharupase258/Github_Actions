variable "tushar_RGvarsM" {
  type = map(object({
    name     = string
    location = string
  }))
}

// variable "tushar_stgsvarsM" {
//   type = map(object({
//     name                     = string
//     resource_group_name      = string
//     location                 = string
//     account_tier             = string
//     account_replication_type = string
//   }))
// }

// variable "tushar_containersvarsM" {
//   type = map(object({
//     name                  = string
//     storage_account_id    = string
//     container_access_type = string
//     storage_account_name  = string
//   }))
// }

// variable "tushar_vnetvarsM" {
//   type = map(object({
//     name                = string
//     resource_group_name = string
//     location            = string
//     address_space       = list(string)
//   }))
// }

// variable "tushar_subnetsvarsM" {
//   type = map(object({
//     name                 = string
//     resource_group_name  = string
//     virtual_network_name = string
//     address_prefixes     = list(string)
//   }))
// }

// variable "tushar_KeyvaultsVarsM" {
//   type = map(object({
//     name                = string
//     resource_group_name = string
//     location            = string
//     sku_name            = string
//     tenant_id           = string
//     object_id           = string
//   }))
// }

// variable "tushar_randompasswordsvarsM" {
//   type = map(object({
//     # length                = number
//     # override_special      = string
//     # prevent_destroy       = bool
//     # create_before_destroy = bool
//     # special               = bool
//     keyvault_name = string
//     value         = string
//     key_vault_id  = string
//     name          = string
//   }))
// }

// variable "tushar_publicipsvarsM" {
//   type = map(object({
//     name                = string
//     location            = string
//     resource_group_name = string
//     allocation_method   = string
//   }))
// }

// variable "tusharnic_varsM" {
//   type = map(object({
//     name                          = string
//     location                      = string
//     resource_group_name           = string
//     ip_configuration_name         = string
//     private_ip_address_allocation = string
//     # public_ip_address_id          = string
//     subnet_id = string
//     # publicip_name                 = string
//     subnet_name = string
//     # nsg_name = string
//   }))
// }

// variable "tushar_vmsvarsM" {
//   type = map(object({
//     name                  = string
//     resource_group_name   = string
//     location              = string
//     size                  = string
//     admin_username        = string
//     admin_password        = string
//     network_interface_ids = list(string)
//     nic_name              = string
//   }))
// }

// variable "tushar_windowsvmsvarM" {
//   type = map(object({
//     name                  = string
//     resource_group_name   = string
//     location              = string
//     size                  = string
//     network_interface_ids = list(string)
//     nic_name              = string
//   }))
// }

// # variable "tushar_AKS_varsM" {
// #   type = map(object({
// #     name                = string
// #     location            = string
// #     resource_group_name = string
// #     dns_prefix          = string
// #     node_count          = number
// #     vm_size             = string
// #   }))
// # }

// # variable "tushar_acrvarsM" {
// #   type = map(object({
// #     name                = string
// #     location            = string
// #     resource_group_name = string
// #     sku                 = string
// #   }))
// # }


// # variable "tusharnsgvarsM" {
// #   type = map(object({
// #     name                                  = string
// #     location                              = string
// #     resource_group_name                   = string
// #     priority                              = number
// #     direction                             = string
// #     access                                = string
// #     protocol                              = any
// #     source_port_ranges                    = any
// #     destination_port_ranges               = any
// #     rule_name                             = string
// #     source_address_prefixes               = optional(any)
// #     destination_address_prefixes          = optional(any)
// #     source_application_security_group_ids = optional(any)

// #   }))
// # }


// variable "tusharbastionvarsM" {
//   type = map(object({
//     name                 = string
//     resource_group_name  = string
//     location             = string
//     ipconfigname_bastion = string
//     publicip_name        = string
//     subnet_name          = string
//     subnet_id            = string
//     public_ip_address_id = string
//     virtual_network_name = string
//   }))
// }

// variable "tushar_linuxvmssvarsM" {
//   type = map(object({
//     name                    = string
//     resource_group_name     = string
//     location                = string
//     sku                     = string
//     instances               = number
//     nic_name                = string
//     ipconfig_name_linuxvmss = string
//     subnet_id               = string
//     subnet_name             = string
//   }))
// }

// variable "tushar_winvmssvarsM" {
//   type = map(object({
//     name                  = string
//     resource_group_name   = string
//     location              = string
//     sku                   = string
//     instances             = number
//     subnet_id             = string
//     subnet_name           = string
//     nic_name              = string
//     ipconfig_name_winvmss = string
//   }))
// }

// variable "tushar_lbsvarsM" {
//   type = map(object({
//     name                = string
//     resource_group_name = string
//     location            = string
//     publicip_name       = string
//     # vnet_name = string
//     # vm_name = string
//   }))
// }

// variable "tushar_lb_backendpoolvarsM" {
//   type = map(object({
//     name    = string
//     lb_name = string
//   }))
// }

// variable "tushar_lbbackendpooladdressvarsM" {
//   type = map(object({
//     name             = string
//     backendpool_name = string
//     vm_name          = string
//     vnet_name        = string
//   }))
// }

// variable "tusharlb_healthprobesvarsM" {
//   type = map(object({
//     name                = string
//     port                = number
//     protocol            = string
//     number_of_probes    = optional(number)
//     request_path        = optional(string)
//     interval_in_seconds = optional(number)
//     lb_name             = string
//   }))
// }

// variable "tusharlb_rulevarsM" {
//   type = map(object({
//     name                           = string
//     frontend_ip_configuration_name = string
//     backend_port                   = number
//     frontend_port                  = number
//     protocol                       = string
//     # probe_id                        = string
//     enable_tcp_reset        = optional(bool, false)
//     enable_floating_ip      = optional(bool, false)
//     load_distribution       = optional(string, "Default")
//     idle_timeout_in_minutes = optional(number, 4)
//     # backend_address_pool_ids        = list(string)
//     lb_name          = string
//     probe_name       = string
//     backendpool_name = string
//   }))
// }

// variable "tushar_appgatewaysvarsM" {
//   type = map(object({
//     name                           = string
//     resource_group_name            = string
//     location                       = string
//     sku_name                       = string
//     tier                           = string
//     capacity                       = number
//     gateway_ip_configuration_name  = string
//     frontend_port_name             = string
//     frontend_port                  = number
//     frontend_ip_configuration_name = string
//     backend_address_pool_name      = string
//     backend_http_settings_name     = string
//     backend_http_settings_port     = number
//     cookie_based_affinity          = string
//     backend_http_settings_protocol = string
//     http_listener_name             = string
//     http_listener_protocol         = string
//     request_routing_rule_name      = string
//     rule_type                      = string
//     priority                       = number
//     subnet_name                    = string
//     publicip_name                  = string
//   }))
// }

// variable "tushar_appgateways" {
//   type = map(object({
//     name                = string
//     resource_group_name = string
//     location            = string
//     sku_name            = string
//     tier                = string
//     capacity            = number

//     gateway_ip_configuration_name = string
//     subnet_name                   = string
//     subnet_rg                     = string
//     vnet_name                     = string

//     frontend_ports = list(object({
//       name = string
//       port = number
//     }))

//     frontend_ip_configurations = list(object({
//       name           = string
//       public_ip_name = string
//       public_ip_rg   = string
//     }))

//     backend_address_pools = list(object({
//       name      = string
//       nic_names = list(string)
//       nic_rgs   = list(string)
//     }))

//     backend_http_settings = list(object({
//       name                  = string
//       port                  = number
//       cookie_based_affinity = string
//       protocol              = string
//     }))

//     http_listeners = list(object({
//       name                           = string
//       frontend_port_name             = string
//       frontend_ip_configuration_name = string
//       protocol                       = string
//     }))

//     request_routing_rules = list(object({
//       name                       = string
//       rule_type                  = string
//       http_listener_name         = string
//       backend_address_pool_name  = string
//       backend_http_settings_name = string
//       priority                   = number
//     }))
//   }))
// }


// variable "tushar_service_planvarsM" {
//   type = map(object({
//     name                = string
//     resource_group_name = string
//     location            = string
//     sku_name            = string
//     os_type             = string
//   }))
// }

// variable "tushar_functionappvarsM" {
//   type = map(object({
//     name                 = string
//     resource_group_name  = string
//     location             = string
//     storage_account_name = string
//     # storage_account_access_key = string
//     # app_service_plan_id        = string
//     service_plan_name = string
//   }))
// }

// variable "tushar_logicapp_standardvarsM" {
//   type = map(object({
//     name                  = string
//     resource_group_name   = string
//     location              = string
//     storage_account_name  = string
//     app_service_plan_name = string
//   }))
// }
