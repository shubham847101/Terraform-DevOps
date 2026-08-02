data azurerm_resource_group "data-shubham-rg" {
  for_each = var.rg-values
  name = each.value.name
}