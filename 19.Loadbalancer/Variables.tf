variable "tushar_lbsvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    publicip_name = string
    # vnet_name = string
    # vm_name = string
  }))
}

variable "tushar_publicipsvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}

variable "tushar_vnetvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}

variable "tushar_vmsvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}

variable "tushar_lb_backendpoolvars" {
  type = map(object({
    name = string
    lb_name = string
  }))
}

variable "tushar_lbbackendpooladdressvars" {
  type = map(object({
    name = string
    backendpool_name = string
    vm_name = string
    vnet_name = string
  }))
}

variable "tusharlb_healthprobesvars" {
  type = map(object({
    name = string
    port = number
    protocol = string
    number_of_probes = optional(number)
    request_path = optional(string)
    interval_in_seconds = optional(number)
    lb_name = string
  }))
}

variable "tusharlb_rulevars" {
  type = map(object({
    name                            = string
    frontend_ip_configuration_name  = string
    backend_port                    = number
    frontend_port                   = number
    protocol                        = string
    # probe_id                        = string
    enable_tcp_reset                = optional(bool, false)
    enable_floating_ip              = optional(bool, false)
    load_distribution                = optional(string, "Default")
    idle_timeout_in_minutes         = optional(number, 4)
    # backend_address_pool_ids        = list(string)
    lb_name = string
    probe_name = string
    backendpool_name = string
  }))
}