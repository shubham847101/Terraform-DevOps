data azurerm_resource_group "data-shubham-rg" {
 for_each = var.rg-values
 name = each.value.name
}

data azurerm_virtual_network "data-shubham-vnet" {
  for_each = var.vnet-values
  name                = each.value.name
  resource_group_name =  data.azurerm_resource_group.data-shubham-rg[each.value.rg-key].name
}