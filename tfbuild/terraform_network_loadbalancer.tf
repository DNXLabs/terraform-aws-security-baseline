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
