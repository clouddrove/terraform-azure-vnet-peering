provider "azurerm" {
  features {}
}

module "resource_group_1" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  name        = "example_1"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "North Europe"
}

module "resource_group_2" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  name        = "example_2"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "East US"
}



#Vnet
module "vnet" {
  source  = "clouddrove/vnet/azure"
  version = "1.0.0"

  name        = "app"
  environment = "example"
  label_order = ["name", "environment"]

  resource_group_name = module.resource_group_1.resource_group_name
  location            = module.resource_group_1.resource_group_location
  address_space       = "10.0.0.0/16"
  enable_ddos_pp      = false
}

#Vnet
module "vnet_remote" {
  source  = "clouddrove/vnet/azure"
  version = "1.0.0"

  name        = "remote"
  environment = "example"
  label_order = ["name", "environment"]

  resource_group_name = module.resource_group_2.resource_group_name
  location            = module.resource_group_2.resource_group_location
  address_space       = "20.0.0.0/16"
  enable_ddos_pp      = false
}

module "vnet_peering" {
  source     = "../"
  depends_on = [module.resource_group_1, module.resource_group_2]

  enabled_peering       = true
  resource_group_1_name = module.resource_group_1.resource_group_name
  resource_group_2_name = module.resource_group_2.resource_group_name

  allow_gateway_transit_vnet1 = false
  use_remote_gateways_vnet1   = false
  allow_gateway_transit_vnet2 = false
  use_remote_gateways_vnet2   = false
  different_rg                = true
  vnet_1_name                 = module.vnet.vnet_name[0]
  vnet_1_id                   = module.vnet.vnet_id[0]
  vnet_2_name                 = module.vnet_remote.vnet_name[0]
  vnet_2_id                   = module.vnet_remote.vnet_id[0]

}
