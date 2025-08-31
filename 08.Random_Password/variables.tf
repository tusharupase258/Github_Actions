variable "tushar_randompasswordsvars" {
  type = map(object({
    # length = number
    # override_special = string
    # prevent_destroy = bool
    # create_before_destroy = bool
    # special = bool
    keyvault_name = string
    value = string
    key_vault_id = string
    name = string
  }))
}

variable "tushar_KeyvaultsVars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}