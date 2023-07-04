# Create a security group
resource "aws_security_group" "my_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  # Inbound rule
  ingress {
    from_port   = var.inbound_port
    to_port     = var.inbound_port
    protocol    = "tcp"
    cidr_blocks = [var.inbound_cidr]
  }

  # Outbound rule (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}
