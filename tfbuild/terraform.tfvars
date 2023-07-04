aws_region = "ap-southeast-1"
s3_bucket_name = "terraform-aws-security-baseline"
environment = "development"

vpc_cidr_block = "10.0.0.0/16"
vpc_name     = "MyVPC"

public_subnet_cidr     = "10.0.0.0/24"
public_subnet_az     = "ap-southeast-1a"
private_subnet_cidr     = "10.0.1.0/24"
private_subnet_az     = "ap-southeast-1b"
internal_subnet_cidr     = "10.0.2.0/24"
internal_subnet_az     = "ap-southeast-1c"

inbound_cidr     = "0.0.0.0/0"
inbound_port     = 80
security_group_description     = "My security group description"
security_group_name     = "MySecurityGroup"

nlb_internal     = false
load_balancer_name     = "MyNetworkLoadBalancer"

internet_gateway_name     = "MyInternetGateway"
