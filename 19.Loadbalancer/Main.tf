resource"azurerm_lb""tushar_lbs"{
    for_each = var.tushar_lbsvars
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    frontend_ip_configuration {
      name = "${each.value.name}-frontend_ip_config"
      public_ip_address_id = data.azurerm_public_ip.tushar_publicip_data[each.value.publicip_name].id
    }
}

resource "azurerm_lb_backend_address_pool" "tushar_lbbackendpool" {
    depends_on = [ azurerm_lb.tushar_lbs ]
    for_each = var.tushar_lb_backendpoolvars
    name = each.value.name
    loadbalancer_id = azurerm_lb.tushar_lbs[each.value.lb_name].id
}

resource "azurerm_lb_backend_address_pool_address" "tushar_lbbackendpooladdress" {
  depends_on = [ azurerm_lb_backend_address_pool.tushar_lbbackendpool ]
  for_each = var.tushar_lbbackendpooladdressvars
  name = each.value.name
  backend_address_pool_id = azurerm_lb_backend_address_pool.tushar_lbbackendpool[each.value.backendpool_name].id
  ip_address = data.azurerm_virtual_machine.tushar_vmdata[each.value.vm_name].private_ip_address
  virtual_network_id = data.azurerm_virtual_network.tushar_vnetdata[each.value.vnet_name].id
}

resource "azurerm_lb_probe" "tushar_lbprobes" {
  for_each = var.tusharlb_healthprobesvars
  name = each.value.name
  port = each.value.port
  protocol = each.value.protocol
  interval_in_seconds = each.value.interval_in_seconds
  loadbalancer_id = azurerm_lb.tushar_lbs[each.value.lb_name].id
  number_of_probes = each.value.number_of_probes
  request_path = each.value.request_path
}

resource "azurerm_lb_rule" "tusharlb_rules" {
    for_each = var.tusharlb_rulevars
    name = each.value.name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    backend_port = each.value.backend_port
    frontend_port = each.value.frontend_port
    protocol = each.value.protocol
    loadbalancer_id = azurerm_lb.tushar_lbs[each.value.lb_name].id
    probe_id = azurerm_lb_probe.tushar_lbprobes[each.value.probe_name].id
    enable_tcp_reset = each.value.enable_tcp_reset
    enable_floating_ip = each.value.enable_floating_ip
    load_distribution = each.value.load_distribution
    idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
    backend_address_pool_ids = [azurerm_lb_backend_address_pool.tushar_lbbackendpool[each.value.backendpool_name].id]
}