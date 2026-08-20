data "azurerm_resource_group" "shubham-rg1" {
 for_each = var.rg-values
 name = each.value.name
}

data "azurerm_network_interface" "shubham-nic" {
  for_each = var.nic-values
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.shubham-rg1[each.value.rg-key].name
}