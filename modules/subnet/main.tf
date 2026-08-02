resource "azurerm_subnet" "example" {
  for_each = var.subnet-values
  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.data-shubham-rg[each.value.rg-key].name
  virtual_network_name = data.azurerm_virtual_network.data-shubham-vnet[each.value.vnet-key].name
  address_prefixes     = each.value.address_prefixes
}