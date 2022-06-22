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
  vnet_1_name         = ""
  vnet_1_id           = ""

  vnet_2_name = ""
  vnet_2_id   = ""

}
