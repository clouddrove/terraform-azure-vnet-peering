provider "azurerm" {
  subscription_id = "000000-11111-1223-XXX-XXXXXXXXXXXX"
  features {}
}

module "resource_group_1" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app1"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "North Europe"
}

module "resource_group_2" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app2"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "East US"
}



#Vnet
module "vnet" {
  source  = "clouddrove/vnet/azure"
  version = "1.0.4"

  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group_1.resource_group_name
  location            = module.resource_group_1.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

#Vnet
module "vnet_remote" {
  source  = "clouddrove/vnet/azure"
  version = "1.0.4"

  name                = "remote"
  environment         = "test"
  resource_group_name = module.resource_group_2.resource_group_name
  location            = module.resource_group_2.resource_group_location
  address_spaces      = ["20.0.0.0/16"]
}

module "vnet_peering" {
  source = "../.."

  enabled_peering       = true
  resource_group_1_name = module.resource_group_1.resource_group_name
  resource_group_2_name = module.resource_group_2.resource_group_name

  different_rg = true
  vnet_1_name  = module.vnet.vnet_name
  vnet_1_id    = module.vnet.vnet_id
  vnet_2_name  = module.vnet_remote.vnet_name
  vnet_2_id    = module.vnet_remote.vnet_id
}
