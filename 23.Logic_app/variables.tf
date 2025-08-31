variable "tushar_logicapp_standardvars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    storage_account_name = string
    app_service_plan_name = string
  }))
}

variable "tushar_stgsvars" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}

variable "tushar_service_planvars" {
    type = map(object({
      name = string
      resource_group_name = string
    }))
}
