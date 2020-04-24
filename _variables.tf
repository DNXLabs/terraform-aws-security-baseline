# == REQUIRED VARS

variable "name" {
  description = "Name of this ECS cluster"
}
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
