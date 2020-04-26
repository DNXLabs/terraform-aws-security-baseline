# --------------------------------------------------------------------------------------------------
# CloudWatch Alarms Baseline
# --------------------------------------------------------------------------------------------------

module "alarm_baseline" {
  source = "./modules/alarm-baseline"

  enabled                   = var.enable_alarm_baseline
  alarm_namespace           = var.alarm_namespace
  cloudtrail_log_group_name = var.cloudtrail_log_group_name
  sns_topic_name            = var.alarm_sns_topic_name

  tags = var.tags
}

# --------------------------------------------------------------------------------------------------
# Chatbot Notifications
# --------------------------------------------------------------------------------------------------
module "chatbot" {
  source = "git::https://github.com/DNXLabs/terraform-aws-chatbot?ref=0.1.0"

  enabled             = var.enable_chatbot_slack
  org_name            = var.org_name
  workspace_name      = var.alarm_namespace
  slack_channel_id    = var.slack_channel_id
  slack_workspace_id  = var.slack_workspace_id
  alarm_sns_topic_arn = module.alarm_baseline.alarm_sns_topic.*.arn[0]
  tags                = var.tags
}
