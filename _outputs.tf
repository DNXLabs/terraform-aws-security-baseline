# --------------------------------------------------------------------------------------------------
# Outputs from alarm-baseline module.
# --------------------------------------------------------------------------------------------------

output "alarm_sns_topic" {
  description = "The SNS topic to which CloudWatch Alarms will be sent."
  value       = module.alarm_baseline.alarm_sns_topic
}
