# terraform-aws-security
Terraform module to set up AWS account with the secure baseline configuration based on CIS Amazon Web Services Foundations.

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_namespace | The namespace in which all alarms are set up. | `string` | `"CISBenchmark"` | no |
| alarm\_sns\_topic\_name | The name of the SNS Topic which will be notified when any alarm is performed. | `string` | `"CISAlarm"` | no |
| cloudtrail\_log\_group\_name | The name of Cloudtrail log group. | `string` | `"bubbletea-cloudtrail"` | no |
| enable\_alarm\_baseline | The boolean flag whether this module is enabled or not. No resources are created when set to false. | `string` | `"false"` | no |
| enable\_chatbot\_slack | If true, will create aws chatboot and integrate to slack | `string` | `"false"` | no |
| org\_name | Name for this organization | `any` | n/a | yes |
| slack\_channel\_id | Sclack channel id to send budget notfication using AWS Chatbot | `string` | `""` | no |
| slack\_workspace\_id | Sclack workspace id to send budget notfication using AWS Chatbot | `string` | `""` | no |
| tags | Specifies object tags key and value. This applies to all resources created by this module. | `map` | <pre>{<br>  "Terraform": true<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| alarm\_sns\_topic | The SNS topic to which CloudWatch Alarms will be sent. |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-security/blob/master/LICENSE) for full details.