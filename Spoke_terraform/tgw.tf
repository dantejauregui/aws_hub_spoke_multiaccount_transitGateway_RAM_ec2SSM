# THIS is the cross-account connection:
resource "aws_ec2_transit_gateway_vpc_attachment" "dev" {
  subnet_ids         = [aws_subnet.private.id]
  transit_gateway_id = var.tgw_id
  vpc_id             = aws_vpc.dev.id

  tags = {
    Name = "dev-to-tgw"
  }
}
