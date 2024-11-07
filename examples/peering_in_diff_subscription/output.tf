output "vnet_peer_1_id" {
  value       = module.vnet_peering.vnet_peer_1_id
  description = "The ID of the newly created virtual network peering on the first virtual network."
}

output "vnet_peer_2_id" {
  value       = module.vnet_peering.vnet_peer_2_id
  description = "The ID of the newly created virtual network peering on the second virtual network."
}

output "vnet_peer_1_name" {
  value       = module.vnet_peering.vnet_peer_1_name
  description = "The name of the newly created virtual network peering on the first virtual network."
}

output "vnet_peer_2_name" {
  value       = module.vnet_peering.vnet_peer_2_name
  description = "The name of the newly created virtual network peering on the second virtual network."
}
