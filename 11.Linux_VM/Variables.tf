variable "tushar_vmsvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    size = string
    admin_username = string
    admin_password = string
    network_interface_ids = list(string)
    nic_name = string
  }))
}

variable "tusharnic_vars" {
    type = map(object({
      name = string
      resource_group_name = string
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