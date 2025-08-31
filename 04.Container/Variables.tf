variable "tushar_stgsvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    account_tier = string
    account_replication_type = string
  }))
}

variable "tushar_containersvars" {
  type = map(object({
    name = string
    storage_account_id = string
    container_access_type = string
    storage_account_name = string
  }))
}