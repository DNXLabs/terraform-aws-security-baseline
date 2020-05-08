# --------------------------------------------------------------------------------------------------
# Set up AWS Config recorder and let it publish results and send notifications.
# --------------------------------------------------------------------------------------------------

resource "aws_sns_topic" "config" {
  count = var.enabled ? 1 : 0

  name     = var.sns_topic_name
  provider = aws.account
  tags     = var.tags
}
resource "aws_iam_role_policy_attachment" "config" {
  count      = var.enabled ? 1 : 0
  provider   = aws.account
  role       = aws_iam_role.config_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role" "config_role" {
  count    = var.enabled ? 1 : 0
  provider = aws.account
  name     = "awsconfig-role"

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
  count = var.enabled ? 1 : 0

  name     = var.recorder_name
  provider = aws.account

  role_arn = aws_iam_role.config_role[0].arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = var.include_global_resource_types
  }
}

resource "aws_config_delivery_channel" "bucket" {
  count = var.enabled ? 1 : 0

  name     = var.delivery_channel_name
  provider = aws.account

  s3_bucket_name = var.s3_bucket_name
  s3_key_prefix  = var.s3_key_prefix
  sns_topic_arn  = aws_sns_topic.config[0].arn

  snapshot_delivery_properties {
    delivery_frequency = var.delivery_frequency
  }

  depends_on = [aws_config_configuration_recorder.recorder[0]]
}

resource "aws_config_configuration_recorder_status" "recorder" {
  count    = var.enabled ? 1 : 0
  provider = aws.account

  name = aws_config_configuration_recorder.recorder[0].id

  is_enabled = true
  depends_on = [aws_config_delivery_channel.bucket[0]]
}

# --------------------------------------------------------------------------------------------------
# A config rule to monitor open known ports.
# --------------------------------------------------------------------------------------------------

resource "aws_config_config_rule" "restricted_ports" {
  count    = var.enabled ? 1 : 0
  provider = aws.account

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