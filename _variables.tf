# --------------------------------------------------------------------------------------------------
# Variables for alarm-baseline module.
# --------------------------------------------------------------------------------------------------


variable "alarm_namespace" {
  description = "The namespace in which all alarms are set up."
  default     = "CISBenchmark"
}

variable "alarm_sns_topic_name" {
  description = "The name of the SNS Topic which will be notified when any alarm is performed."
  default     = "CISAlarm"
}
variable "cloudtrail_log_group_name" {
  description = "The name of Cloudtrail log group."
  default     = "bubbletea-cloudtrail"
}
variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Terraform" = true
  }
}