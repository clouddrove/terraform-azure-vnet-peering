## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alias\_subs\_id | Alias for remote provider in module. | `string` | `""` | no |
| allow\_forwarded\_traffic\_vnet1 | Controls if forwarded traffic from VMs in the remote virtual network is allowed | `bool` | `false` | no |
| allow\_forwarded\_traffic\_vnet2 | Controls if forwarded traffic from VMs in the remote virtual network is allowed | `bool` | `false` | no |
| allow\_forwarded\_traffic\_vnet\_diff\_subs | Controls if forwarded traffic from VMs in the remote virtual network is allowed | `bool` | `false` | no |
| allow\_gateway\_transit\_vnet1 | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | `false` | no |
| allow\_gateway\_transit\_vnet2 | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | `false` | no |
| allow\_gateway\_transit\_vnet\_diff\_subs | Controls gatewayLinks can be used in the different subscription virtual network’s link to the local virtual network. | `bool` | `false` | no |
| allow\_virtual\_network\_access | Controls if the VMs in the remote virtual network can access VMs in the local virtual network. | `bool` | `true` | no |
| diff\_subs\_resource\_group\_name | The name of remote resource group to be imported. | `string` | `""` | no |
| different\_rg | Flag to tell whether peering is to be done in same in resource group or different resource group | `bool` | `false` | no |
| enabled\_diff\_subs\_peering | n/a | `bool` | `false` | no |
| enabled\_peering | Set to false to prevent the module from creating any resources. | `bool` | `false` | no |
| resource\_group\_1\_name | The name of 1st existing resource group to be imported. | `string` | `""` | no |
| resource\_group\_2\_name | The name of 2nd existing resource group to be imported. | `string` | `""` | no |
| use\_remote\_gateways\_vnet1 | Controls if remote gateways can be used on the local virtual network | `bool` | `false` | no |
| use\_remote\_gateways\_vnet2 | Controls if remote gateways can be used on the local virtual network | `bool` | `false` | no |
| use\_remote\_gateways\_vnet\_diff\_subs | Controls if remote gateways can be used on the different subscription virtual network | `bool` | `false` | no |
| vnet\_1\_id | The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created. | `string` | `""` | no |
| vnet\_1\_name | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `""` | no |
| vnet\_2\_id | The full Azure resource ID of the remote virtual network. Changing this forces a new resource to be created. | `string` | `""` | no |
| vnet\_2\_name | The name of the remote virtual network. | `string` | `""` | no |
| vnet\_diff\_subs\_id | The id of the remote virtual network. | `string` | `""` | no |
| vnet\_diff\_subs\_name | The name of the remote virtual network. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_peer\_1\_id | The id of the newly created virtual network peering in on first virtual netowork. |
| vnet\_peer\_1\_name | The name of the newly created virtual network peering in on first virtual netowork. |
| vnet\_peer\_2\_id | The id of the newly created virtual network peering in on second virtual netowork. |
| vnet\_peer\_2\_name | The name of the newly created virtual network peering in on second virtual netowork. |
| vnet\_peer\_diff\_subs\_id | The id of the newly created virtual network peering in on different subscription virtual netowork. |
| vnet\_peer\_diff\_subs\_name | The name of the newly created virtual network peering in on different subscription virtual netowork. |

