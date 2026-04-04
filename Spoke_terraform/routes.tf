# this is what actually sends traffic out:
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev.id
}

# resource "aws_route" "internet" {
#   route_table_id         = aws_route_table.private.id
#   destination_cidr_block = "0.0.0.0/0"
# Private route table sends it to the Transit Gateway:
#   transit_gateway_id     = var.tgw_id
# }

resource "aws_route" "private_internet" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  # Private route table sends it to the NAT Gateway:
  nat_gateway_id = aws_nat_gateway.dev.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev.id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
