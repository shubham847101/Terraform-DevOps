resource "azurerm_lb" "example" {
  for_each = var.lb-values
  name                = each.value.lb-name
  location            = data.azurerm_resource_group.shubham-rg[each.value.rg-key].location
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_config_name
    public_ip_address_id = data.azurerm_public_ip.shubham-pip[each.value.pip-key].id
  }
}