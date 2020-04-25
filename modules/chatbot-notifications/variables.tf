variable "org_name" {
  description = "Name for this organization"
}
variable "enable" {
  description = "If true, will create aws chatboot and integrate to slack"
  default     = "false"
}
variable "slack_channel_id" {
  description = "Slack channel id to send budget notfication using AWS Chatbot"
  default     = ""
}
variable "slack_workspace_id" {
  description = "Slack workspace id to send budget notfication using AWS Chatbot"
  default     = ""
}
variable "alarm_sns_topic_arn" {
  description = "SNS Topic ARN to connect to AWS Chatbot"
}


variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Terraform" = true
  }
}