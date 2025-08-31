# variable "tushar_publicipsvars" {
#   type = map(object({
#     name = string
#     resource_group_name = string
#   }))
# }

variable "tusharbastionvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    ipconfigname_bastion = string
    publicip_name = string
    subnet_name = string
    subnet_id = string
    public_ip_address_id = string
    virtual_network_name = string
  }))
}

# variable "tushar_subnetsvars" {
#   type = map(object({
#     name = string
#     resource_group_name = string
#     virtual_network_name = string
#   }))
# }