provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "North Europe"
}

#Vnet
module "vnet" {
  source              = "clouddrove/vnet/azure"
  version             = "1.0.3"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}

provider "azurerm" {
  alias = "mgmt"
  features {}
  subscription_id = "8XXXXXXXXXXXXXXXX53b2a80"
}

data "azurerm_resource_group" "mgmt-rg" {
  provider = azurerm.mgmt
  name     = "example-rg"
}

data "azurerm_virtual_network" "mgmt-staging-vnet" {
  provider            = azurerm.mgmt
  name                = "example-vnet"
  resource_group_name = data.azurerm_resource_group.mgmt-rg.name
}

module "vnet_peering" {
  source                        = "../.."
  enabled_diff_subs_peering     = true
  resource_group_1_name         = module.resource_group.resource_group_name
  diff_subs_resource_group_name = data.azurerm_resource_group.mgmt-rg.name

  alias_subs_id       = "82XXXXXXXXXXXXXXXXXXXXa80"
  vnet_1_name         = module.vnet.vnet_name[0]
  vnet_1_id           = module.vnet.vnet_id[0]
  vnet_diff_subs_name = data.azurerm_virtual_network.mgmt-staging-vnet.name
  vnet_diff_subs_id   = data.azurerm_virtual_network.mgmt-staging-vnet.id
}


