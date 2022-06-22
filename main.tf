module "labels" {
  source      = "clouddrove/labels/azure"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  attributes  = var.attributes
  extra_tags  = var.extra_tags
}

resource "azurerm_virtual_network_peering" "peering" {
  count                     = var.enabled_peering ? 1 : 0
  name                      = format("%s-peering1", module.labels.id)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_1_name
  remote_virtual_network_id = var.vnet_2_id
}

resource "azurerm_virtual_network_peering" "peering-back" {
  count                     = var.enabled_peering ? 1 : 0
  name                      = format("%s-peering2", module.labels.id)
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_2_name
  remote_virtual_network_id = var.vnet_1_id
}
