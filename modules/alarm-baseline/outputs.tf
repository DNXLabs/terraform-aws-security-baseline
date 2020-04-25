output "alarm_sns_topic" {
  description = "The SNS topic to which CloudWatch Alarms will be sent."
  value       = aws_sns_topic.alarms
}
output "sns_topic_arn" {
  description = "The ARN SNS topic to which CloudWatch Alarms will be sent."
  value       = aws_sns_topic.arn
}