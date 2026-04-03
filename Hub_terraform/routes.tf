# Public route table (IGW)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.egress.id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


# Private route table (to NAT)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.egress.id
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}


# TGW routing
resource "aws_ec2_transit_gateway_route" "internet" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.egress.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.egress.id
}

resource "aws_ec2_transit_gateway_route_table_association" "egress_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.egress.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.egress.id
}
