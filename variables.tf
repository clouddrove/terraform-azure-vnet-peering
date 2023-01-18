#Module      : LABEL
#Description : Terraform label module variable
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

## peering
variable "enabled_peering" {
  type        = bool
  default     = false
  description = "Set to false to prevent the module from creating any resources."
}

variable "vnet_1_name" {
  type        = string
  default     = ""
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "vnet_2_id" {
  type        = string
  default     = ""
  description = "The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created."
}

variable "vnet_1_id" {
  type        = string
  default     = ""
  description = "The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created."
}

variable "vnet_2_name" {
  type        = string
  default     = ""
  description = "The name of the remote virtual network."
}

variable "allow_virtual_network_access" {
  type        = bool
  default     = true
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network."
}

variable "allow_forwarded_traffic" {
  type        = bool
  default     = true
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed"
}

variable "allow_gateway_transit_vnet1" {
  type        = bool
  default     = false
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
}

variable "allow_gateway_transit_vnet2" {
  type        = bool
  default     = false
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
}

variable "use_remote_gateways_vnet1" {
  type        = bool
  default     = false
  description = "Controls if remote gateways can be used on the local virtual network"
}

variable "use_remote_gateways_vnet2" {
  type        = bool
  default     = false
  description = "Controls if remote gateways can be used on the local virtual network"
}

variable "resource_group_1_name" {
  type        = string
  default     = ""
  description = "The name of 1st existing resource group to be imported."
}

variable "resource_group_2_name" {
  type        = string
  default     = ""
  description = "The name of 2nd existing resource group to be imported."
}

variable "different_rg" {
  type        = bool
  default     = false
  description = "Flag to tell whether vnet in same resource group or different resource group."
}
