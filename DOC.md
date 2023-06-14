<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | n/a | `string` | `"ami-07151644aeb34558a"` | no |
| <a name="input_aws"></a> [aws](#input\_aws) | n/a | <pre>object({<br>    ami = string, instance_type = string<br>  })</pre> | <pre>{<br>  "ami": "ami-07151644aeb34558a",<br>  "instance_type": "t2.micro"<br>}</pre> | no |
| <a name="input_iam_users"></a> [iam\_users](#input\_iam\_users) | n/a | `set(string)` | <pre>[<br>  "jack",<br>  "john"<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_password"></a> [password](#input\_password) | The root password for our VM | `string` | `"p4ssw0rd"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"eu-central-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_instance_server_ip"></a> [aws\_instance\_server\_ip](#output\_aws\_instance\_server\_ip) | n/a |
<!-- END_TF_DOCS -->