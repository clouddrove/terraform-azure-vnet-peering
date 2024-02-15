provider "azurerm" {
  features {}
}

module "vnet_peering" {
  source                = "../.."
  enabled_peering       = true
  resource_group_1_name = "name"
  resource_group_2_name = "namehhh"
  different_rg          = true

  vnet_1_name = "abc"
  vnet_1_id   = "/subscriptions/123******012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue"
  vnet_2_name = "abcrr"
  vnet_2_id   = "/subscriptions/123******012/resourceGroups/example-resource-group/providers/Microsoft.Network/virtualNetworks/virtualNetworksValue"
}