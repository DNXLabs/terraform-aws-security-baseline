variable "s3_bucket_name" {
  description = "The name of the s3 bucket"
  type        = string
}

variable "environment" {
  description = "The name of the AWS account environment"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_subnet_az" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_subnet_az" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "internal_subnet_cidr" {
  description = "CIDR block for the internal subnet"
  type        = string
}

variable "internal_subnet_az" {
  description = "Availability zone for the internal subnet"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}

variable "inbound_port" {
  description = "Port number for the inbound rule"
  type        = string
}

variable "inbound_cidr" {
  description = "CIDR block for the inbound rule"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the network load balancer"
  type        = string
}

variable "nlb_internal" {
  description = "Indicates whether the load balancer should be internal or not"
  type        = string
}

variable "internet_gateway_name" {
  description = "Name of the internet gateway"
  type        = string
}

variable "enabled" {
  description = "The boolean flag whether this module is enabled or not. No resources are created when set to false."
  default     = true
}

variable "alarm_namespace" {
  description = "The namespace in which all alarms are set up."
  default     = "CISBenchmark"
}

variable "cloudtrail_log_group_name" {
  description = "The name of the CloudWatch Logs group to which CloudTrail events are delivered."
  default     = "Anomaly"
}

variable "sns_topic_name" {
  description = "The name of the SNS Topic which will be notified when any alarm is performed."
  default     = "CISAlarm"
}

variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Terraform" = true
  }
}

