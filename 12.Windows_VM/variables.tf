variable "tushar_windowsvmsvar" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    size = string
    network_interface_ids = list(string)
    nic_name = string
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

variable "tusharnic_vars" {
    type = map(object({
      name = string
      resource_group_name = string
    }))
}
