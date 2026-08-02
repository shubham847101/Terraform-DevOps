resource "azurerm_public_ip" "shubham_pip" {
  for_each = var.pip-values
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
  location            = data.azurerm_resource_group.shubham-rg[each.value.rg-key].location
  allocation_method   = each.value.allocation_method
}