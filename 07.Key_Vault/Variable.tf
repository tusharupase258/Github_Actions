variable "tushar_KeyvaultsVars" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku_name = string
    tenant_id = string
    object_id = string
  }))
}