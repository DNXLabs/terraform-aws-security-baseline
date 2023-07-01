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
