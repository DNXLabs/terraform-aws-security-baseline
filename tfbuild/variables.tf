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
}

