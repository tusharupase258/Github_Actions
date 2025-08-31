variable "tushar_linuxvmssvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku = string
    instances = number
    nic_name = string
    ipconfig_name_linuxvmss = string
    subnet_id = string
    subnet_name = string
  }))
}

variable "tushar_subnetsvars" {
  type = map(object({
    name = string
    resource_group_name = string
    virtual_network_name = string
  }))
}

variable "tushar_KeyvaultsVars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}


variable "tushar_randompasswordsvars" {
  type = map(object({
    keyvault_name = string
    value = string
    key_vault_id = string
    name = string
  }))
}
