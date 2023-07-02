resource "aws_ec2_transit_gateway" "tgw" {
  auto_accept_shared_attachments    = "disable"
  default_route_table_association   = "disable"
  default_route_table_propagation   = "disable"
  dns_support                       = "enable"
  vpn_ecmp_support                  = "enable"

  description = "TGW as a network transit hub to interconnect attachments VPCs within the same AWS account."

  tags = {
    Terraform = "true"
    Name = "tgw"
  }
}

output "tgw_id" {
  value = var.TGW_ID
}