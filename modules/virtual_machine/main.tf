resource "azurerm_linux_virtual_machine" "shubham-vm" {
  for_each = var.shubham-vms
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.shubham-rg1[each.value.rg-key].name
  location            = data.azurerm_resource_group.shubham-rg1[each.value.rg-key].location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  
  network_interface_ids = data.azurerm_network_interface.shubham-nic[each.value.network_interface_ids].id

  disable_password_authentication = each.value.disable_password_authentication

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}