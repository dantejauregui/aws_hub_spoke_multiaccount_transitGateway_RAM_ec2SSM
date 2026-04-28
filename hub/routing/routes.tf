resource "aws_ec2_transit_gateway_route_table_association" "spoke" {
  transit_gateway_attachment_id  = data.tfe_outputs.spoke_attach.outputs.tgw_attachment_id
  transit_gateway_route_table_id = data.tfe_outputs.hub_core.outputs.tgw_route_table_id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "spoke" {
  transit_gateway_attachment_id  = data.tfe_outputs.spoke_attach.outputs.tgw_attachment_id
  transit_gateway_route_table_id = data.tfe_outputs.hub_core.outputs.tgw_route_table_id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.spoke
  ]
}

resource "aws_route" "hub_public_to_spoke" {
  route_table_id         = data.tfe_outputs.hub_core.outputs.hub_public_route_table_id
  destination_cidr_block = data.tfe_outputs.spoke_attach.outputs.spoke_vpc_cidr
  transit_gateway_id     = data.tfe_outputs.hub_core.outputs.tgw_id
}

