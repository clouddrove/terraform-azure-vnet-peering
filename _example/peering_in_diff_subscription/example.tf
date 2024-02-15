provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app-vnet"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

#Vnet
module "vnet" {
  source              = "clouddrove/vnet/azure"
  version             = "1.0.4"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.1.0.0/16"]
}

provider "azurerm" {
  alias = "mgmt"
  features {}
  subscription_id = "068245d4-3c94-42fe-9c4d-9e5e1cabc60c"
}

data "azurerm_resource_group" "mgmt-rg" {
  provider = azurerm.mgmt
  name     = "deepak-test"
}

data "azurerm_virtual_network" "mgmt-staging-vnet" {
  provider            = azurerm.mgmt
  name                = "test-d"
  resource_group_name = data.azurerm_resource_group.mgmt-rg.name
}

module "vnet_peering" {
  source                        = "../.."
  enabled_diff_subs_peering     = true
  resource_group_1_name         = module.resource_group.resource_group_name
  diff_subs_resource_group_name = data.azurerm_resource_group.mgmt-rg.name

  alias_subs_id       = "068245d4-3c94-42fe-9c4d-9e5e1cabc60c"
  vnet_1_name         = module.vnet.vnet_name
  vnet_1_id           = module.vnet.vnet_id
  vnet_diff_subs_name = data.azurerm_virtual_network.mgmt-staging-vnet.name
  vnet_diff_subs_id   = data.azurerm_virtual_network.mgmt-staging-vnet.id
}


