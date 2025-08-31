# resource "azurerm_kubernetes_cluster" "tushar_AKS_clusters" {
#   for_each = var.tushar_AKS_vars
#   name = each.value.name
#   location = each.value.location
#   resource_group_name = each.value.resource_group_name
#   dns_prefix = each.value.dns_prefix
#   default_node_pool {
#     name = "default"
#     node_count = each.value.node_count
#     vm_size = each.value.vm_size
#   }
#   identity {
#     type = "SystemAssigned"
#   }

# network_profile {
#   network_plugin    = "azure"
#   load_balancer_sku = "standard"
#   network_policy = "calico"
# }
#  role_based_access_control_enabled = true
# }

# output "kube_config" {
#   value = { for k, v in azurerm_kubernetes_cluster.tushar_AKS_clusters : k => v.kube_config_raw }
# }


# output "aks_id" {
#   value = { for k, v in azurerm_kubernetes_cluster.tushar_AKS_clusters : k => v.id }
# }