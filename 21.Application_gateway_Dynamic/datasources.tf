# Flatten Subnets
locals {
  subnet_map = {
    for gw_key, gw in var.tushar_appgateways

:
    gw_key => {
      name                 = gw.subnet_name
      virtual_network_name = gw.vnet_name
      resource_group_name  = gw.subnet_rg
    }
  }

  # Flatten Public IPs
  public_ip_map = {
    for pip in flatten([
      for gw_key, gw in var.tushar_appgateways

: [
        for pip in gw.frontend_ip_configurations : {
          key                 = "${gw_key}-${pip.name}"
          name                = pip.public_ip_name
          resource_group_name = pip.public_ip_rg
        }
      ]
    ]) : pip.key => {
      name                = pip.name
      resource_group_name = pip.resource_group_name
    }
  }

  # Flatten NICs
  nic_map = {
    for nic in flatten([
      for gw_key, gw in var.tushar_appgateways

: [
        for pool in gw.backend_address_pools : [
          for idx, nic_name in pool.nic_names : {
            key                 = "${gw_key}-${pool.name}-${nic_name}"
            name                = nic_name
            resource_group_name = pool.nic_rgs[idx]
          }
        ]
      ]
    ]) : nic.key => {
      name                = nic.name
      resource_group_name = nic.resource_group_name
    }
  }
}

# Subnets
data "azurerm_subnet" "subnets" {
  for_each = local.subnet_map
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

# Public IPs
data "azurerm_public_ip" "publicips" {
  for_each = local.public_ip_map
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

# NICs
data "azurerm_network_interface" "nics" {
  for_each = local.nic_map
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}