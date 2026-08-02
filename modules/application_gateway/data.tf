data "azurerm_resource_group" "shubham-rg" {
  for_each = var.rg-values
  name = each.value.name
}

data "azurerm_virtual_network" "shubham-vnet" {
  for_each = var.vnet-values
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
}

data "azurerm_public_ip" "shubham-pip" {
  for_each = var.pip-values
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
}

data "azurerm_subnet" "shubham-subnet" {
  for_each = var.subnet-values
  name = each.value.name
  virtual_network_name = data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
}