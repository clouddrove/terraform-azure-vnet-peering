provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "clouddrove/resource-group/azure"
  version     = "1.0.0"
  environment = "test"
  label_order = ["name", "environment"]

  name     = "example"
  location = "North Europe"
}

module "vnet_peering" {
  source = "../"

  name                = "network"
  environment         = "test"
  label_order         = ["environment", "name"]
  enabled_peering     = true
  resource_group_name = module.resource_group.resource_group_name
  vnet_1_name         = azurerm_virtual_network.example1.name
  vnet_1_id           = azurerm_virtual_network.example1.id

  vnet_2_name = azurerm_virtual_network.example.name
  vnet_2_id   = azurerm_virtual_network.example.id

}
