resource "azurerm_network_security_group" "example" {
  for_each = var.nsg-values
  name                = each.value.nsg-name
  location            = data.azurerm_resource_group.shubham-rg[each.value.rg-key].location
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name

  security_rule {
    name                       = each.value.security-name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
  }
}