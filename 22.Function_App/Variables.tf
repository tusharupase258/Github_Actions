variable "tushar_service_planvars" {
    type = map(object({
      name = string
      resource_group_name = string
      location = string
      sku_name = string
      os_type = string
    }))
}

variable "tushar_functionappvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    storage_account_name = string
    # storage_account_access_key = string
    # app_service_plan_id = string
    service_plan_name = string
  }))
}

variable "tushar_stgsvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}