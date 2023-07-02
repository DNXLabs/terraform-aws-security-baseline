resource "aws_wafv2_web_acl" "waf" {
  name        = "WAF_ALB"
  description = "WAF rules for ALB"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }
  rule {
    name     = "SizeConstraint"
    priority = 1

    action {
      block {}
    }
    statement {
      size_constraint_statement {
        comparison_operator = "GT"
        size                = "8000"
        field_to_match {
          all_query_arguments {}
        }
        text_transformation {
          priority = 1
          type     = "NONE"
        }
      }

    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "SizeConstraint"
      sampled_requests_enabled   = false
    }
  }
  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 2

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = false
    }
  }
  rule {
    name     = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 3

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = false
    }
  }
  rule {
    name     = "AWSManagedRulesLinuxRuleSet"
    priority = 4

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesLinuxRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesLinuxRuleSet"
      sampled_requests_enabled   = false
    }
  }
  rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 5

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = false
    }
  }
  rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 6

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = false
    }
  }
  rule {
    name     = "AWSManagedRulesBotControlRuleSet"
    priority = 7

    override_action {
      count {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesBotControlRuleSet"
        vendor_name = "AWS"

        excluded_rule {
          name = "SignalNonBrowserUserAgent"
        }
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesBotControlRuleSet"
      sampled_requests_enabled   = false
    }
  }
  # rule {
  #   name     = "AWSManagedRulesPHPRuleSet"
  #   priority = 8

  #   override_action {
  #     count {}
  #   }
  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesPHPRuleSet"
  #       vendor_name = "AWS"
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "AWSManagedRulesPHPRuleSet"
  #     sampled_requests_enabled   = false
  #   }
  # }
  # rule {
  #   name     = "AWSManagedRulesUnixRuleSet"
  #   priority = 9

  #   override_action {
  #     count {}
  #   }
  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesUnixRuleSet"
  #       vendor_name = "AWS"
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "AWSManagedRulesUnixRuleSet"
  #     sampled_requests_enabled   = false
  #   }
  # }
  # rule {
  #   name     = "AWSManagedRulesWordPressRuleSet"
  #   priority = 10

  #   override_action {
  #     count {}
  #   }
  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesWordPressRuleSet"
  #       vendor_name = "AWS"
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "AWSManagedRulesWordPressRuleSet"
  #     sampled_requests_enabled   = false
  #   }
  # }
  # rule {
  #   name     = "AWSManagedRulesWindowsRuleSet"
  #   priority = 11

  #   override_action {
  #     count {}
  #   }
  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesWindowsRuleSet"
  #       vendor_name = "AWS"
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "AWSManagedRulesWindowsRuleSet"
  #     sampled_requests_enabled   = false
  #   }
  # }
  # rule {
  #   name     = "AWSManagedRulesAdminProtectionRuleSet"
  #   priority = 12

  #   override_action {
  #     count {}
  #   }
  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesAdminProtectionRuleSet"
  #       vendor_name = "AWS"
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "AWSManagedRulesAdminProtectionRuleSet"
  #     sampled_requests_enabled   = false
  #   }
  # }
  # rule {
  #   name     = "AWSManagedRulesAnonymousIpList"
  #   priority = 13

  #   override_action {
  #     count {}
  #   }
  #   statement {
  #     managed_rule_group_statement {
  #       name        = "AWSManagedRulesAnonymousIpList"
  #       vendor_name = "AWS"
  #     }
  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "AWSManagedRulesAnonymousIpList"
  #     sampled_requests_enabled   = false
  #   }
  # }
  # rule {
  #   name     = "RateLimit"
  #   priority = 14

  #   action {
  #     block {}
  #   }
  #   statement {
  #     rate_based_statement {
  #       limit              = 100 # smallest value for testing
  #       aggregate_key_type = "IP"
  #     }

  #   }
  #   visibility_config {
  #     cloudwatch_metrics_enabled = true
  #     metric_name                = "RateLimit"
  #     sampled_requests_enabled   = false
  #   }
  # }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "ManagedRules"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_web_acl_association" "waf_to_alb" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}