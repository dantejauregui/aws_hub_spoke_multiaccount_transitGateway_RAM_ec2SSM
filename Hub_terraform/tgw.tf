resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "central-tgw"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = "${local.name}-tgw"
  }
}

# transit_gateway_vpc_attachment has to be created in each of the 2 VPCs??:
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
