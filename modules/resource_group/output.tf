# output "resource_groups" {
#   value = {
#     for k, rg in azurerm_resource_group.shubham_rg :
#     k => {
#       name = rg.name
#       location = rg.location
#     }
#   }
# }