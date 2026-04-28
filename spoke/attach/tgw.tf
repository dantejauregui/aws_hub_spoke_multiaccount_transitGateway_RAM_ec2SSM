resource "aws_ram_resource_share_accepter" "hub_tgw" {
  count = var.accept_ram_share ? 1 : 0

  share_arn = data.tfe_outputs.hub_ram.outputs.ram_share_arn
}

resource "aws_ec2_transit_gateway_vpc_attachment" "spoke" {
  subnet_ids         = [aws_subnet.private.id]
  transit_gateway_id = data.tfe_outputs.hub_core.outputs.tgw_id
  vpc_id             = aws_vpc.spoke.id

  tags = {
    Name = "${var.name}-to-hub-tgw"
  }

  depends_on = [
    aws_ram_resource_share_accepter.hub_tgw
  ]
}

