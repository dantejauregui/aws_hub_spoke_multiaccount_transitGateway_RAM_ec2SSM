resource "aws_route_table" "private" {
  vpc_id = aws_vpc.spoke.id

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route" "internet_to_tgw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.tfe_outputs.hub_core.outputs.tgw_id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.spoke
  ]
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

