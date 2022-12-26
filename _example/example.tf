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


#Vnet
module "vnet" {
  source  = "clouddrove/virtual-network/azure"
  version = "1.0.1"

  name        = "app"
  environment = "example"
  label_order = ["name", "environment"]

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
  enable_ddos_pp      = false

  #subnet
  subnet_names                  = ["subnet1"]
  subnet_prefixes               = ["10.0.1.0/24"]
  disable_bgp_route_propagation = false

}

#Vnet
module "vnet_remote" {
  source  = "clouddrove/virtual-network/azure"
  version = "1.0.1"

  name        = "remote"
  environment = "example"
  label_order = ["name", "environment"]

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "20.0.0.0/16"
  enable_ddos_pp      = false

  #subnet
  subnet_names                  = ["subnet1"]
  subnet_prefixes               = ["20.0.1.0/24"]
  disable_bgp_route_propagation = false

}

module "vnet_peering" {
  source     = "../"
  depends_on = [module.resource_group]

  enabled_peering             = true
  resource_group_name         = module.resource_group.resource_group_name
  virtual_network_name        = module.vnet.vnet_name[0]
  remote_virtual_network_id   = [module.vnet_remote.vnet_id[0]]
  remote_virtual_network_name = [module.vnet_remote.vnet_name[0]]
}

module "vnet_peering_back" {
  source     = "../"
  depends_on = [module.resource_group]

  enabled_peering             = true
  resource_group_name         = module.resource_group.resource_group_name
  virtual_network_name        = module.vnet_remote.vnet_name[0]
  remote_virtual_network_id   = [module.vnet.vnet_id[0]]
  remote_virtual_network_name = [module.vnet.vnet_name[0]]
}
