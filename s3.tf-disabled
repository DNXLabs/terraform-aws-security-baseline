data "aws_iam_policy_document" "s3_policy_config" {
  count = var.enable_config_baseline ? 1 : 0
  statement {
    sid    = "ConfigLogs"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    actions = [
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${local.config_s3_bucket_name}/*"
    ]
  }
  statement {
    sid    = "OrgAccounts"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions = [
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${local.config_s3_bucket_name}/*"
    ]
  }
  statement {
    sid    = "OrgAccountsAcl"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions = [
      "s3:GetBucketAcl",
      "s3:PutBucketAcl"
    ]
    resources = [
      "arn:aws:s3:::${local.config_s3_bucket_name}"
    ]
  }
  statement {
    sid    = "ConfigLogsAcl"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    actions = [
      "s3:GetBucketAcl"
    ]
    resources = [
      "arn:aws:s3:::${local.config_s3_bucket_name}"
    ]
  }
}

resource "aws_s3_bucket" "config" {
  count  = var.enable_config_baseline ? 1 : 0
  bucket = local.config_s3_bucket_name
  acl    = "private"
  policy = data.aws_iam_policy_document.s3_policy_config[0].json

  lifecycle {
    ignore_changes = [
      versioning,
      grant
    ]
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "ARCHIVING"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
