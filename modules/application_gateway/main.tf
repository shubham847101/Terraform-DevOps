resource "azurerm_application_gateway" "network" {
  for_each = var.appgw-values
  name                = each.value.appgw-name
  resource_group_name = data.azurerm_resource_group.shubham-rg[each.value.rg-key].name
  location            = data.azurerm_resource_group.shubham-rg[each.value.rg-key].location

  sku {
    name     = each.value.sku-name
    tier     = each.value.sku-tier
    capacity = each.value.sku-capacity
  }

  gateway_ip_configuration {
    name      = each.value.gw-ip-config-name
    subnet_id = data.azurerm_subnet.shubham-subnet[each.value.subnet-key].id
  }

  frontend_port {
    name = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-frontend-port
    port = each.value.frontend-port
  }

  frontend_ip_configuration {
    name                 = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-frontend-ip
    public_ip_address_id = data.azurerm_public_ip.shubham-pip[each.value.pip-key].id
  }

  backend_address_pool {
    name = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-backend-pool
  }

  backend_http_settings {
    name                  = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-be-htst
    cookie_based_affinity = each.value.cookie-affinity
    path                  = each.value.path
    port                  = each.value.backend-http-settings-port
    protocol              = each.value.backend-http-settings-protocol
    request_timeout       = each.value.backend-http-settings-request-timeout
  }

  http_listener {
    name                           = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-httplstn
    frontend_ip_configuration_name = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-feip
    frontend_port_name             = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-feport
    protocol                       = each.value.http-listener-protocol
  }

  request_routing_rule {
    name                       = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-rqrt
    priority                   = each.value.request-routing-rule-priority
    rule_type                  = each.value.request-routing-rule-type
    http_listener_name         = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-httplstn
    backend_address_pool_name  = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-beap
    backend_http_settings_name = "${data.azurerm_virtual_network.shubham-vnet[each.value.vnet-key].name}"-be-htst
  }
}