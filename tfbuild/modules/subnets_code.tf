/*
# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.private_subnet_az

  tags = {
    Name = "PrivateSubnet"
  }
}

# Create an internal subnet
resource "aws_subnet" "internal_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.internal_subnet_cidr
  availability_zone       = var.internal_subnet_az

  tags = {
    Name = "InternalSubnet"
  }
}
*/