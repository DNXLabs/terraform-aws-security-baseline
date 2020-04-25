resource "aws_cloudformation_stack" "tf_chatbot" {
  count = var.enable ? 1 : 0
  name  = "terraform-chatbot-${var.org_name}"
  parameters = {
    ConfigurationNameParam = var.org_name
    IamRoleArnArnParam     = aws_iam_role.chatbot-role.*.arn[0]
    SnsTopicArnParam       = var.alarm_sns_topic_arn
    SlackChannelIdParam    = var.slack_channel_id
    SlackWorkspaceIdParam  = var.slack_workspace_id
  }
  template_body = file("${path.module}/cf-chatbot.yml")
}


resource "aws_iam_role" "chatbot-role" {
  count              = var.enable ? 1 : 0
  name               = "${var.org_name}-chatbot-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_chatbot.*.json[0]
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "chatbot_policy" {
  count      = var.enable ? 1 : 0
  role       = aws_iam_role.chatbot-role.*.name[0]
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
data "aws_iam_policy_document" "assume_role_chatbot" {
  count = var.enable ? 1 : 0
  statement {

    principals {
      type = "Service"
      identifiers = [
        "chatbot.amazonaws.com"
      ]
    }
    actions = [
      "sts:AssumeRole",
    ]
  }
}
