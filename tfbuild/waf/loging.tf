#Uncomment this and comment the code below if you want to send logs to s3bucket

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

#Uncomment this and comment the code above if you want send logs to cloud_watch  

# resource "aws_wafv2_web_acl_logging_configuration" "cloud_watch_waf" {
#   log_destination_configs = [aws_cloudwatch_log_group.log_group.arn]
#   resource_arn            = aws_wafv2_web_acl.waf.arn
#   redacted_fields {
#     uri_path {}
#   }
#   redacted_fields {
#     query_string {}
#   }
#   redacted_fields {
#     method {}
#   }
#   redacted_fields {
#     single_header {
#       name = "user-agent"
#     }
#   }
# }
