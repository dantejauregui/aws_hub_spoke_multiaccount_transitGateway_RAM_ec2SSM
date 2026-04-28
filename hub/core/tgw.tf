resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "central-tgw"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments  = "enable"

  tags = {
    Name = "${var.name}-tgw"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "egress" {
  subnet_ids         = [aws_subnet.private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.egress.id

  tags = {
    Name = "${var.name}-tgw-attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table" "egress" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "${var.name}-tgw-rt"
  }
}

