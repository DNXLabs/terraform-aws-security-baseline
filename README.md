# terraform-aws-security-baseline

[![Lint Status](https://github.com/DNXLabs/terraform-aws-security-baseline/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-security-baseline/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-security-baseline)](https://github.com/DNXLabs/terraform-aws-security-baseline/blob/master/LICENSE)

This terraform module sets up AWS account with the secure baseline configuration based on Center for Internet Security (CIS) Amazon Web Services Foundations.

Submodules:

  - alarm-baseline - This modules set up CloudWatch alarms to notify when critical changes happen in AWS account. Those CloudWatch metrics and alarms are defined in the CIS benchmark.

    - Unauthorised api call
    - No Multi-factor authentication (MFA) console signin
    - Root Usage
    - Identity and Access Management (IAM) changes
    - Cloudtrail configuration changes
    - Console signin failures
    - Disable or Delete Customer Master Keys (CMK)
    - S3 Bucket policy changes
    - AWS Config Changes
    - Security Group Changes
    - Network Access Control List (NACL) changes
    - Network Gateways changes
    - Route Table Changes
    - Virtual Private Cloud (VPC) Changes

  - Terraform-aws-chatbot - An utility Module to create AWS Chatbot and its dependencies git::https://github.com/DNXLabs/terraform-aws-chatbot?ref=0.1.1

The following resources will be created:

 - S3 bucket - S3 bucket which will store configuration snapshots
 - Cloudwatch alarms
 - Simple Notification Services (SNS) topic
 - Identity and Access Management (IAM) role - This role lets you define a set of permissions. AWS Config assumes the role that you assign to it to write to your S3 bucket, publish to your SNS topic, and to make Describe or List API requests to get configuration details for your AWS resources.


In addition you have the option to :

 - Create an alarm namespace - The name that all alarms are setup
 - Cloudtrail logs group name
 - Set the frequency which AWS Config sends a snapshot into the S3 bucket
 - Speficy whether AWS config includes all supported types of global resources with the resources that it records
 - Enable or not the alarm baseline - It's a boolean flag that enables or not the cloudwatch alarm baseline. If false, no resources are created
 - Enable or not AWS chatbot - It's a boolean flag that creates or not aws chatbot and integrates to slack
    - If enabled:
       - Creates aws chatboot and integrate to slack
       - Creates a Slack channel id to send budget notification using AWS Chatbot
       - Creates a Slack workspace id to send budget notification using AWS Chatbot
 - Enable or not the config baseline - It's a boolean that creates or not AWS Config

   - If true:
       - Creates AWS Config

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_namespace | The namespace in which all alarms are set up. | `string` | `"CISBenchmark"` | no |
| alarm\_sns\_topic\_name | The name of the SNS Topic which will be notified when any alarm is performed. | `string` | `"CISAlarm"` | no |
| aws\_region | The AWS region to deploy into (e.g. ap-southeast-2). | `string` | `"ap-southeast-2"` | no |
| cloudtrail\_log\_group\_name | The name of Cloudtrail log group. | `string` | `"bubbletea-cloudtrail"` | no |
| config\_delivery\_frequency | The frequency which AWS Config sends a snapshot into the S3 bucket. | `string` | `"One_Hour"` | no |
| config\_include\_global\_resource\_types | Specifies whether AWS Config includes all supported types of global resources with the resources that it records. | `bool` | `true` | no |
| config\_s3\_bucket\_name | The name of the S3 bucket which will store configuration snapshots. | `any` | n/a | yes |
| enable\_alarm\_baseline | The boolean flag whether this module is enabled or not. No resources are created when set to false. | `string` | `"false"` | no |
| enable\_chatbot\_slack | If true, will create aws chatboot and integrate to slack | `string` | `"false"` | no |
| enable\_config\_baseline | If true, will create aws config | `string` | `"false"` | no |
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
