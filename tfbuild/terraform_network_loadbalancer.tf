# Create a network load balancer
resource "aws_lb" "my_network_lb" {
  name               = var.load_balancer_name
  internal           = var.nlb_internal
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id = aws_subnet.internal_subnet.id
  }

  tags = {
    Name = var.load_balancer_name
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
  internet_gateway_id = aws_internet_gateway.my_internet_gateway.id
  vpc_id              = aws_vpc.my_vpc.id
}