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
  source = "git::https://github.com/DNXLabs/terraform-aws-chatbot?ref=0.1.1"

  enabled             = var.enable_chatbot_slack
  org_name            = var.org_name
  workspace_name      = var.alarm_namespace
  slack_channel_id    = var.slack_channel_id
  slack_workspace_id  = var.slack_workspace_id
  alarm_sns_topic_arn = module.alarm_baseline.alarm_sns_topic.*.arn[0]
  tags                = var.tags
}
# --------------------------------------------------------------------------------------------------
# AWS COnfig Baseline
# --------------------------------------------------------------------------------------------------
module "config" {
  source = "./modules/config-baseline"

  enabled                       = var.enable_config_baseline
  s3_bucket_name                = var.config_s3_bucket_name
  delivery_frequency            = var.config_delivery_frequency
  include_global_resource_types = var.config_include_global_resource_types
  iam_role_arn                  = var.config_iam_role_arn
  tags                          = var.tags
}
