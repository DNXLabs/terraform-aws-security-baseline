variable "bucket_name" {
  type        = string
  description = "Give a name wich begins with aws-waf-logs- "
  default     = "aws-waf-logs-sahjdsja98"
}

variable "log_group_name" {
  type        = string
  description = "Give a name wich begins with aws-waf-logs- "
  default     = "aws-waf-logs-sahjdsjadsd98"
}

variable "alb_arn" {
  type        = string
  description = "Put here arn of you Application Load Balancer"
}
