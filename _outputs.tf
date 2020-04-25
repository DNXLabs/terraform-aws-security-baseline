# --------------------------------------------------------------------------------------------------
# Outputs from alarm-baseline module.
# --------------------------------------------------------------------------------------------------

output "alarm_sns_topic" {
  description = "The SNS topic to which CloudWatch Alarms will be sent."
  value       = module.alarm_baseline.alarm_sns_topic
}
output "sns_topic_arn" {
  description = "The ARN SNS topic to which CloudWatch Alarms will be sent."
  value       = module.alarm_baseline.sns_topic_arn
}