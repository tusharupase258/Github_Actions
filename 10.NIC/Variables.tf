variable "tusharnic_vars" {
    type = map(object({
      name = string
      location = string
      resource_group_name = string
      ip_configuration_name = string
      private_ip_address_allocation = string
      # public_ip_address_id = string
      subnet_id = string
      # publicip_name = string
      subnet_name = string
      # nsg_name = string
    }))
}

variable "tushar_publicipsvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}

variable "tushar_subnetsvars" {
  type = map(object({
    name = string
    resource_group_name = string
    virtual_network_name = string
  }))
}

# variable "tusharnsgvars" {
#   type = map(object({
#     name = string
#     resource_group_name = string
#   }))
# }