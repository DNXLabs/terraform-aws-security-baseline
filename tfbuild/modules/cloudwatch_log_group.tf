resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    name        = "s3bucketforwaf"
    description = "S3 bucket for WAF logging"
  }
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = var.log_group_name

  tags = {
    name        = "loggroupforwaf"
    description = "CloudWatch Log Group for WAF logging"
  }
}

resource "aws_wafv2_web_acl_logging_configuration" "s3bucket_waf" {
  log_destination_configs = [aws_s3_bucket.bucket.arn]
  resource_arn            = aws_wafv2_web_acl.waf.arn
  redacted_fields {
    uri_path {}
  }
  redacted_fields {
    query_string {}
  }
  redacted_fields {
    method {}
  }
  redacted_fields {
    single_header {
      name = "user-agent"
    }
  }
}