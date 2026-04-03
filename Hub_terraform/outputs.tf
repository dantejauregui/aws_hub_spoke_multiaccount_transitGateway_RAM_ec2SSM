output "tgw_id" {
  value = aws_ec2_transit_gateway.tgw.id
}

output "egress_vpc_id" {
  value = aws_vpc.egress.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "tgw_route_table_id" {
  value = aws_ec2_transit_gateway_route_table.egress.id
}
