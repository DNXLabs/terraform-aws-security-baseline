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