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

variable "virtual_network_name" {
  type        = string
  default     = ""
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "remote_virtual_network_id" {
  type        = list(any)
  default     = []
  description = "The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created."
}

variable "remote_virtual_network_name" {
  type        = list(any)
  default     = []
  description = "The name of the remote virtual network."
}

variable "allow_virtual_network_access" {
  type        = bool
  default     = true
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network."
}

variable "allow_forwarded_traffic" {
  type        = bool
  default     = false
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed"
}

variable "allow_gateway_transit" {
  type        = bool
  default     = false
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
}

variable "use_remote_gateways" {
  type        = bool
  default     = false
  description = "Controls if remote gateways can be used on the local virtual network"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of an existing resource group to be imported."
}
