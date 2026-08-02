resource azurerm_virtual_network "shubham-vnet" {
  for_each = var.vnet-values
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.data-shubham-rg[each.value.rg-key].name
  location = data.azurerm_resource_group.data-shubham-rg[each.value.rg-key].location
  address_space = each.value.address_space
}