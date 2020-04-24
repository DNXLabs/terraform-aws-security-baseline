# --------------------------------------------------------------------------------------------------
# The SNS topic to which CloudWatch alarms send events.
# --------------------------------------------------------------------------------------------------

resource "aws_sns_topic" "alarms" {
  count = var.enabled ? 1 : 0

  name = var.sns_topic_name

  tags = var.tags
}
# --------------------------------------------------------------------------------------------------
# CloudWatch metrics and alamrs defined in the CIS benchmark.
# --------------------------------------------------------------------------------------------------

resource "aws_cloudwatch_log_metric_filter" "unauthorized_api_calls" {
  count = var.enabled ? 1 : 0

  name           = "UnauthorizedAPICalls"
  pattern        = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
  log_group_name = var.cloudtrail_log_group_name

  metric_transformation {
    name      = "UnauthorizedAPICalls"
    namespace = var.alarm_namespace
    value     = "1"
  }
}