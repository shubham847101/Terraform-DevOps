# Variable declaration for resource group
variable "rg-values" {
  type = map(object({
    name     = string
    location = string
  }))
}

# Variable declaration for virtual network
variable "vnet-values" {
  type = map(object({
  name = string
  rg-key = string
  address_space = list(string)
  }))
}

# Variable declaration for subnets
variable "subnet-values" {
  type = map(object({
    name = string
    rg-key = string
    vnet-key = string
    address_prefixes = list(string)
  }))
}

# Variable declaration for public IP addresses
variable "pip-values" {
  type = map(object({
    name = string
    rg-key = string
    allocation_method = string
  }))
}

# Variable declaration for network interface cards
variable "nic-values" {
  type = map(object({
    nic-name = string
    rg-key = string
    ipconfig-name = string
    subnet_id = string
    private_ip_address_allocation = string
}))
}

# Variable declaration for network security groups
variable "nsg-values" {
  type = map(object({
  nsg-name = string
  rg-key = string
    security-name = string
    priority = number
    direction = string
    access = string
    protocol = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string
  }))
}

variable "lb-values" {
  type = map(object({
    lb-name = string
    rg-key = string
    pip-key = string
    frontend_ip_config_name = string
  }))
}

variable "appgw-values" {
  type = map(object({
    appgw-name = string
    rg-key = string
    sku-name = string
    sku-tier = string
    sku-capacity = number
    vnet-key = string
    gw-ip-config-name = string
    frontend-port = number
    pip-key = string
    # frontend_ip_config_name = string
    http-listener-protocol = string
    routing-rule-type = string
    cookie-affinity = string
    path = string
    backend-http-settings-port = number
    backend-http-settings-protocol = string
    backend-http-settings-request-timeout = number
    request-routing-rule-priority = number
    request-routing-rule-type = string
    subnet-key = string
  }))
}

variable "shubham-vms" {
  type = map(object({
    name = string
    rg-key = string
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