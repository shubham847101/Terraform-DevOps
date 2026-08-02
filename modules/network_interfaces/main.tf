resource "azurerm_network_interface" "nic-names" {
  for_each = var.nic-values
  name                = each.value.nic-name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
  location = data.azurerm_resource_group.shubham-rg[each.value.rg-key].location

  ip_configuration {
    name                          = each.value.ipconfig-name
    subnet_id                     = data.azurerm_subnet.shubham-subnet[each.value.subnet-key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}