######################
# Main Transit Gateway

resource "aws_ec2_transit_gateway" "TransitGateway" {
  description                     = "Transit Gateway Between 4 VPCS"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    Name = "TGW"
  }
}


