provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  name        = "example"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "North Europe"
}

module "vnet_peering" {
  source     = "../"
  depends_on = [module.resource_group]

  enabled_peering             = true
  resource_group_name         = module.resource_group.resource_group_name
  virtual_network_name        = ""
  remote_virtual_network_id   = ""
  remote_virtual_network_name = ""
}

module "vnet_peering_back" {
  source     = "../"
  depends_on = [module.resource_group]

  enabled_peering             = true
  resource_group_name         = module.resource_group.resource_group_name
  virtual_network_name        = ""
  remote_virtual_network_id   = ""
  remote_virtual_network_name = ""
}
