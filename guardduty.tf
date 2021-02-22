resource "aws_guardduty_detector" "primary" {
  enable = true
}

resource "aws_guardduty_detector" "member" {
  count  = var.guardduty ? 1 : 0
  enable = true
}

resource "aws_guardduty_member" "member" {
  count    = var.guardduty ? 1 : 0
  provider = aws.master

  account_id                 = aws_guardduty_detector.member[0].account_id
  detector_id                = try(var.guardduty_detector_id, aws_guardduty_detector.primary.id)
  email                      = var.account_email
  invite                     = true
  disable_email_notification = true

  lifecycle {
    ignore_changes = [email]
  }
}

resource "aws_guardduty_invite_accepter" "member" {
  count = var.guardduty ? 1 : 0

  depends_on = [aws_guardduty_member.member]

  detector_id       = aws_guardduty_detector.member[0].id
  master_account_id = var.master_account_id
}
