# This file was created instead a sub module since we found an issue passing the provider to child submodules
# AWS Config should be enabled into all accounts (master and sub accounts)
resource "aws_sns_topic" "config" {
  count = var.enable_config_baseline ? 1 : 0

  name = "ConfigChanges"
  tags = var.tags
}
resource "aws_iam_role_policy_attachment" "config" {
  count      = var.enable_config_baseline ? 1 : 0
  role       = aws_iam_role.config_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role_policy" "config_s3" {
  count  = var.enable_config_baseline ? 1 : 0
  name   = "awsconfig-policy"
  policy = data.aws_iam_policy_document.config_s3[0].json
  role   = aws_iam_role.config_role[0].name
}

data "aws_iam_policy_document" "config_s3" {
  count = var.enable_config_baseline ? 1 : 0
  statement {
    sid    = "1"
    effect = "Allow"
    actions = [
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${var.config_s3_bucket_name}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
    ]
    condition {
      test     = "StringLike"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control"
      ]
    }
  }
  statement {
    sid       = "2"
    effect    = "Allow"
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${var.config_s3_bucket_name}"]
  }
}

resource "aws_iam_role" "config_role" {
  count = var.enable_config_baseline ? 1 : 0
  name  = "awsconfig-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}
resource "aws_config_configuration_recorder" "recorder" {
  count = var.enable_config_baseline ? 1 : 0

  name = "default"

  role_arn = aws_iam_role.config_role[0].arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = var.config_include_global_resource_types
  }
}

resource "aws_config_delivery_channel" "bucket" {
  count = var.enable_config_baseline ? 1 : 0

  name = "default"

  s3_bucket_name = var.config_s3_bucket_name
  s3_key_prefix  = ""
  sns_topic_arn  = aws_sns_topic.config[0].arn

  snapshot_delivery_properties {
    delivery_frequency = var.config_delivery_frequency
  }

  depends_on = [aws_config_configuration_recorder.recorder[0]]
}

resource "aws_config_configuration_recorder_status" "recorder" {
  count = var.enable_config_baseline ? 1 : 0

  name = aws_config_configuration_recorder.recorder[0].id

  is_enabled = true
  depends_on = [aws_config_delivery_channel.bucket[0]]
}

# --------------------------------------------------------------------------------------------------
# A config rule to monitor open known ports.
# --------------------------------------------------------------------------------------------------

resource "aws_config_config_rule" "restricted_ports" {
  count = var.enable_config_baseline ? 1 : 0

  name = "RestrictedIncomingTraffic"

  source {
    owner             = "AWS"
    source_identifier = "RESTRICTED_INCOMING_TRAFFIC"
  }

  input_parameters = <<JSON
{
  "blockedPort1": "22",
  "blockedPort2": "3389"
}
JSON

  tags = var.tags

  depends_on = [aws_config_configuration_recorder.recorder[0]]
}