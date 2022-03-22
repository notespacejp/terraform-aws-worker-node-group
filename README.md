# terraform-aws-worker-node-group

A module to easily create managed worker node groups for aws.

## Document Update
We use terraform-docs for document generation.
```shell
terraform-docs markdown --output-file README.md .
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.75.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.ng](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_launch_template.lt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bd_config"></a> [bd\_config](#input\_bd\_config) | block device config (ebs only) | <pre>object({<br>		device_name = string<br>		volume_type = string<br>		volume_size = number<br>	})</pre> | <pre>{<br>  "device_name": "/dev/sda1",<br>  "volume_size": 30,<br>  "volume_type": "gp2"<br>}</pre> | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | ON\_DEMAND or SPOT | `string` | `"ON_DEMAND"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | eks cluster name | `string` | n/a | yes |
| <a name="input_ec2_monitoring"></a> [ec2\_monitoring](#input\_ec2\_monitoring) | enable ec2 monitoring | `bool` | `true` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | ami id | `string` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | create instance types | `list(string)` | n/a | yes |
| <a name="input_ng_name"></a> [ng\_name](#input\_ng\_name) | node group name | `string` | n/a | yes |
| <a name="input_node_role_arn"></a> [node\_role\_arn](#input\_node\_role\_arn) | worker node role arn | `string` | `null` | no |
| <a name="input_scaling_config"></a> [scaling\_config](#input\_scaling\_config) | scaling config | <pre>object({<br>		desired_size = number<br>		max_size = number<br>		min_size = number<br>		change_desired_size = bool<br>	})</pre> | <pre>{<br>  "change_desired_size": false,<br>  "desired_size": 1,<br>  "max_size": 1,<br>  "min_size": 1<br>}</pre> | no |
| <a name="input_sg_ids"></a> [sg\_ids](#input\_sg\_ids) | security group id list | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet ids on which to create the worker node | `list(string)` | n/a | yes |
| <a name="input_taints"></a> [taints](#input\_taints) | k8s taints | <pre>list(object({<br>		key = string<br>		value = string<br>		effect = string<br>	}))</pre> | `[]` | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | launch template name | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | user data script | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->