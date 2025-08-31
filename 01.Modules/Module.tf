module "tushar_RGm" {
  source        = "../02.Resource_Group"
  tushar_RGvars = var.tushar_RGvarsM
}

// module "tushar_stgsm" {
//   depends_on      = [module.tushar_RGm]
//   source          = "../03.Storage Account"
//   tushar_stgsvars = var.tushar_stgsvarsM
// }

// module "tushar_containerM" {
//   depends_on            = [module.tushar_stgsm]
//   source                = "../04.Container"
//   tushar_containersvars = var.tushar_containersvarsM
//   tushar_stgsvars       = var.tushar_stgsvarsM
// }

// module "Vnet_module" {
//   depends_on      = [module.tushar_RGm]
//   source          = "../05.Vnet"
//   tushar_vnetvars = var.tushar_vnetvarsM
// }

// module "Subnet_module" {
//   depends_on         = [module.Vnet_module]
//   source             = "../06.Subnet"
//   tushar_subnetsvars = var.tushar_subnetsvarsM
// }

// module "keyvault_module" {
//   depends_on           = [module.tushar_RGm]
//   source               = "../07.Key_Vault"
//   tushar_KeyvaultsVars = var.tushar_KeyvaultsVarsM
// }

// module "random_password_Module" {
//   depends_on                 = [module.keyvault_module]
//   source                     = "../08.Random_Password"
//   tushar_KeyvaultsVars       = var.tushar_KeyvaultsVarsM
//   tushar_randompasswordsvars = var.tushar_randompasswordsvarsM
// }

// module "tushar_publicip_module" {
//   depends_on           = [module.tushar_RGm]
//   source               = "../09.Public_IP_Address"
//   tushar_publicipsvars = var.tushar_publicipsvarsM
// }

// module "tushar_nic_module" {
//   depends_on           = [module.Subnet_module, module.tushar_publicip_module] #module.azurerm_network_security_group_module
//   source               = "../10.NIC"
//   tushar_publicipsvars = var.tushar_publicipsvarsM
//   tushar_subnetsvars   = var.tushar_subnetsvarsM
//   tusharnic_vars       = var.tusharnic_varsM
//   # tusharnsgvars = var.tusharnsgvarsM
// }

// module "tushar_linux_vm_module" {
//   depends_on                 = [module.tushar_nic_module, module.keyvault_module, module.random_password_Module]
//   source                     = "../11.Linux_VM"
//   tushar_KeyvaultsVars       = var.tushar_KeyvaultsVarsM
//   tushar_randompasswordsvars = var.tushar_randompasswordsvarsM
//   tusharnic_vars             = var.tusharnic_varsM
//   tushar_vmsvars             = var.tushar_vmsvarsM
// }

// module "tushar_windows_vm_module" {
//   depends_on                 = [module.keyvault_module, module.tushar_nic_module, module.random_password_Module]
//   source                     = "../12.Windows_VM"
//   tushar_KeyvaultsVars       = var.tushar_KeyvaultsVarsM
//   tushar_randompasswordsvars = var.tushar_randompasswordsvarsM
//   tusharnic_vars             = var.tusharnic_varsM
//   tushar_windowsvmsvar       = var.tushar_windowsvmsvarM
// }

// # module "tushar_AKSm" {
// #   depends_on      = [module.tushar_RGm]
// #   source          = "../13.AKS"
// #   tushar_AKS_vars = var.tushar_AKS_varsM
// # }

// # module "tushar_acrM" {
// #   depends_on     = [module.tushar_RGm]
// #   source         = "../14.ACR"
// #   tushar_acrvars = var.tushar_acrvarsM
// # }

// # module "azurerm_network_security_group_module" {
// #   depends_on    = [module.tushar_RGm]
// #   source        = "../16.NSG"
// #   tusharnsgvars = var.tusharnsgvarsM
// # }


// module "tushar_BastionM" {
//   depends_on        = [module.tushar_RGm, module.Subnet_module, module.tushar_publicip_module]
//   source            = "../15.Bastion_Host"
//   tusharbastionvars = var.tusharbastionvarsM
// }

// module "tushar_linuxvmss" {
//   depends_on                 = [module.Subnet_module, module.random_password_Module]
//   source                     = "../17.Linux_VMSS"
//   tushar_subnetsvars         = var.tushar_subnetsvarsM
//   tushar_randompasswordsvars = var.tushar_randompasswordsvarsM
//   tushar_KeyvaultsVars       = var.tushar_KeyvaultsVarsM
//   tushar_linuxvmssvars       = var.tushar_linuxvmssvarsM
// }

// module "tushar_winvmss" {
//   depends_on                 = [module.Subnet_module, module.random_password_Module]
//   source                     = "../18.Windows_vmss"
//   tushar_KeyvaultsVars       = var.tushar_KeyvaultsVarsM
//   tushar_randompasswordsvars = var.tushar_randompasswordsvarsM
//   tushar_subnetsvars         = var.tushar_subnetsvarsM
//   tushar_winvmssvars         = var.tushar_winvmssvarsM
// }

// module "tushar_lb" {
//   depends_on                      = [module.tushar_RGm, module.tushar_publicip_module, module.tushar_linux_vm_module]
//   source                          = "../19.Loadbalancer"
//   tushar_publicipsvars            = var.tushar_publicipsvarsM
//   tushar_lbsvars                  = var.tushar_lbsvarsM
//   tushar_vnetvars                 = var.tushar_vnetvarsM
//   tushar_vmsvars                  = var.tushar_vmsvarsM
//   tushar_lb_backendpoolvars       = var.tushar_lb_backendpoolvarsM
//   tushar_lbbackendpooladdressvars = var.tushar_lbbackendpooladdressvarsM
//   tusharlb_healthprobesvars       = var.tusharlb_healthprobesvarsM
//   tusharlb_rulevars               = var.tusharlb_rulevarsM
// }

// # module "tushar_appgateways" {
// #   depends_on             = [module.tushar_RGm, module.Subnet_module, module.tushar_publicip_module, module.tushar_nic_module]
// #   source                 = "../20.Application_Gateway"
// #   tushar_publicipsvars   = var.tushar_publicipsvarsM
// #   tushar_subnetsvars     = var.tushar_subnetsvarsM
// #   tusharnic_vars         = var.tusharnic_varsM
// #   tushar_appgatewaysvars = var.tushar_appgatewaysvarsM
// # }

// module "tushar_appgateways_reusable_dynamic" {
//   depends_on         = [module.tushar_RGm, module.Subnet_module, module.tushar_publicip_module, module.tushar_nic_module]
//   source             = "../21.Application_gateway_Dynamic"
//   tushar_appgateways = var.tushar_appgateways
// }

// module "tushar_function_app" {
//   depends_on              = [module.tushar_RGm, module.tushar_stgsm]
//   source                  = "../22.Function_App"
//   tushar_stgsvars         = var.tushar_stgsvarsM
//   tushar_service_planvars = var.tushar_service_planvarsM
//   tushar_functionappvars  = var.tushar_functionappvarsM
// }

// module "tushar_logic_app" {
//   depends_on                   = [module.tushar_RGm, module.tushar_stgsm, module.tushar_function_app]
//   source                       = "../23.Logic_app"
//   tushar_stgsvars              = var.tushar_stgsvarsM
//   tushar_service_planvars      = var.tushar_service_planvarsM
//   tushar_logicapp_standardvars = var.tushar_logicapp_standardvarsM
// }