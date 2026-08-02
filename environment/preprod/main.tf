module "resource_group" {
  source = "../../modules/resource_group"
  rg-values = var.rg-values
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source = "../../modules/virtual_network"
  vnet-values = var.vnet-values
  rg-values = var.rg-values
}

module "subnet" {
  depends_on = [module.virtual_network]
  source = "../../modules/subnet"
  rg-values = var.rg-values
  vnet-values = var.vnet-values
  subnet-values = var.subnet-values
}

module "pip" {
  depends_on = [module.resource_group]
  source = "../../modules/public_ip"
  pip-values = var.pip-values
  rg-values = var.rg-values
}

module "network_interfaces" {
  depends_on = [module.resource_group,module.subnet]
  source = "../../modules/network_interfaces"
  rg-values = var.rg-values
  nic-values = var.nic-values
  subnet-values = var.subnet-values
  vnet-values = var.vnet-values

}

module "nsg" {
  depends_on = [module.resource_group]
  source = "../../modules/network_security_group"
  rg-values = var.rg-values
  nsg-values = var.nsg-values
}

module "loadbalancer" {
  depends_on = [module.pip,module.resource_group]
  source = "../../modules/loadbalancer"
  lb-values = var.lb-values
  rg-values = var.rg-values
  pip-values = var.pip-values
}

module "application_gateway" {
  depends_on = [module.pip,module.resource_group, module.virtual_network, module.subnet]
  source = "../../modules/application_gateway"
  rg-values = var.rg-values
  appgw-values = var.appgw-values
  pip-values = var.pip-values
  subnet-values = var.subnet-values
  vnet-values = var.vnet-values
}
