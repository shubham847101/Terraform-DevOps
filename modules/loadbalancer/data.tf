data "azurerm_resource_group" "shubham-rg" {
  for_each = var.rg-values
  name = each.value.name
}

data "azurerm_public_ip" "shubham-pip" {
  for_each = var.pip-values
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
}