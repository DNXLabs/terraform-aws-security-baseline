
variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Terraform" = true
  }
}

variable "org_name" {
  description = "Name for this organization"
}

variable "enable_config_baseline" {
  description = "If true, will create aws config"
  default     = true
}
variable "config_s3_bucket_name" {
  description = "The name of the S3 bucket which will store configuration snapshots."
  default     = ""
}
variable "config_delivery_frequency" {
  description = "The frequency which AWS Config sends a snapshot into the S3 bucket."
  default     = "One_Hour"
}
variable "config_include_global_resource_types" {
  description = "Specifies whether AWS Config includes all supported types of global resources with the resources that it records."
  default     = true
}

variable "account_email" {
  type        = string
  description = "AWS Account email to be used with Guardduty"
}

variable "master_account_id" {
  description = "Master account ID"
}

variable "guardduty" {
  default     = true
  description = "Enable/Disables guardduty"
}

variable "guardduty_detector_id" {
  default     = ""
  description = "GuardDuty detector ID in the master account"
}

locals {
  config_s3_bucket_name = var.config_s3_bucket_name != "" ? var.config_s3_bucket_name : "${var.org_name}-audit-config-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
}
