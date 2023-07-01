resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  internet_gateway_id  = aws_internet_gateway.my_internet_gateway.id

  tags = {
    Name = var.vpc_name
  }
}