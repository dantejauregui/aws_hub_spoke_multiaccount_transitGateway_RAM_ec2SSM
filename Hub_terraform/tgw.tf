resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "central-tgw"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  # after the TGW is shared through RAM and the Spoke creates its attachment, the Hub should accept it automatically:
  auto_accept_shared_attachments = "enable"

  tags = {
    Name = "${local.name}-tgw"
  }
}

# It is not “one attachment per account”, it is “one attachment per VPC connected to the TGW”:
resource "aws_ec2_transit_gateway_vpc_attachment" "egress" {
  subnet_ids         = [aws_subnet.private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.egress.id

  tags = {
    Name = "${local.name}-tgw-attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table" "egress" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "${local.name}-tgw-rt"
  }
}
