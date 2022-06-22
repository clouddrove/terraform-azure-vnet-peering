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

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "vnet_1_name" {
  type        = string
  default     = ""
  description = "The name of the virtual network."
}

variable "vnet_1_id" {
  type        = string
  default     = ""
  description = "The id of the virtual network."
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "VNET 1 resource group"
}

variable "vnet_2_name" {
  type        = string
  default     = ""
  description = "The name of the virtual network."
}

variable "vnet_2_id" {
  type        = string
  default     = ""
  description = "The id of the virtual network."
}

variable "enabled_peering" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}
