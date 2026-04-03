# this is what actually sends traffic out:
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev.id
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = var.tgw_id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
