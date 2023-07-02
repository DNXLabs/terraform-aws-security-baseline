variable "s3_bucket_arn" {
  type        = list(string)
  description = "Arn of s3 bucket. Put it in [] "
  default     = ["arn:aws:s3:::bucket-20-00"]
}

variable "log_group_name" {
  type        = string
  description = "Give a name wich begins with aws-waf-logs- "
  default     = "aws-waf-logs-sahjdsjadsd98"
}

 #variable "alb_arn" {
 #  type        = string
 #  description = "Put here arn of you Application Load Balancer"
 #  default     = "arn:aws:elasticloadbalancing:us-east-1:526101360909:loadbalancer/app/ALB-DEMO/8f56227f59a13caf"
 # }
