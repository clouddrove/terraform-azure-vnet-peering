<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AZURE VNET-PEERING
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create vnet-peering resource on AZURE.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-azure-vnet-peering'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AZURE+VNET-PEERING&url=https://github.com/clouddrove/terraform-azure-vnet-peering'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AZURE+VNET-PEERING&url=https://github.com/clouddrove/terraform-azure-vnet-peering'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-azure-vnet-peering/releases).


Here are some examples of how you can use this module in your inventory structure:
### Default vnet-peering
```hcl
module "vnet_peering" {
 source                        = "clouddrove/vnet-peering/azure"
 version                       = "1.0.0"
 enabled_peering               = true
 resource_group_1_name         = module.resource_group_1.resource_group_name
 resource_group_2_name         = module.resource_group_2.resource_group_name

 different_rg                  = true
 vnet_1_name                   = module.vnet.vnet_name[0]
 vnet_1_id                     = module.vnet.vnet_id[0]
 vnet_2_name                   = module.vnet_remote.vnet_name[0]
 vnet_2_id                     = module.vnet_remote.vnet_id[0]
}
 ```

  ### vnet-peering in different subscription
```hcl
module "vnet_peering" {
 source                        = "clouddrove/vnet-peering/azure"
 version                       = "1.0.0"
 enabled_diff_subs_peering     = true
 resource_group_1_name         = module.resource_group_1.resource_group_name
 diff_subs_resource_group_name = data.azurerm_resource_group.mgmt-rg.name

 alias_subs_id                 = "82XXXXXXXXXXXXXXXXXXXXa80"
 vnet_1_name                   = module.vnet.vnet_name[0]
 vnet_1_id                     = module.vnet.vnet_id[0]
 vnet_diff_subs_name           = data.azurerm_virtual_network.mgmt-staging-vnet.name
 vnet_diff_subs_id             = data.azurerm_virtual_network.mgmt-staging-vnet.id
}
 ```






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
| attributes | Additional attributes (e.g. `1`). | `list(string)` | `[]` | no |
| diff\_subs\_resource\_group\_name | The name of remote resource group to be imported. | `string` | `""` | no |
| different\_rg | Flag to tell whether peering is to be done in same in resource group or different resource group | `bool` | `false` | no |
| enabled\_diff\_subs\_peering | n/a | `bool` | `false` | no |
| enabled\_peering | Set to false to prevent the module from creating any resources. | `bool` | `false` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | `[]` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `""` | no |
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




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-azure-vnet-peering/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-azure-vnet-peering)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
