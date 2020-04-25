# --------------------------------------------------------------------------------------------------
# Variables for alarm-baseline module.
# --------------------------------------------------------------------------------------------------


variable "enable_alarm_baseline" {
  description = "The boolean flag whether this module is enabled or not. No resources are created when set to false."
  default     = "false"
}
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
# --------------------------------------------------------------------------------------------------
# Variables for chatbot notifications.
# --------------------------------------------------------------------------------------------------
variable "org_name" {
  description = "Name for this organization"
}
variable "enable_chatbot_slack" {
  description = "If true, will create aws chatboot and integrate to slack"
  default     = "false"
}
variable "slack_channel_id" {
  description = "Sclack channel id to send budget notfication using AWS Chatbot"
  default     = ""
}
variable "slack_workspace_id" {
  description = "Sclack workspace id to send budget notfication using AWS Chatbot"
  default     = ""
}
