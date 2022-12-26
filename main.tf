data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}

locals {
  resource_group_name = data.azurerm_resource_group.default.name
  location            = data.azurerm_resource_group.default.location
}

# enable global peering between the two virtual network
resource "azurerm_virtual_network_peering" "peering" {
  count                        = var.enabled_peering ? length(var.remote_virtual_network_id) : 0
  name                         = format("%s-to-%s", var.virtual_network_name, element(var.remote_virtual_network_name, count.index))
  resource_group_name          = local.resource_group_name
  virtual_network_name         = var.virtual_network_name
  remote_virtual_network_id    = element(var.remote_virtual_network_id, count.index)
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways
}
