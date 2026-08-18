variable "shubham-vms" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    size = string
    admin_username = string
    admin_password = string
  
    network_interface_ids = list(string)

    disable_password_authentication = bool

    caching = string
    storage_account_type = string

    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
}