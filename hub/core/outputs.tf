output "tgw_id" {
  description = "Hub Transit Gateway ID."
  value       = aws_ec2_transit_gateway.tgw.id
}

output "tgw_arn" {
  description = "Hub Transit Gateway ARN for AWS RAM sharing."
  value       = aws_ec2_transit_gateway.tgw.arn
}

output "tgw_route_table_id" {
  description = "Custom Hub TGW route table ID used for egress routing."
  value       = aws_ec2_transit_gateway_route_table.egress.id
}

output "egress_tgw_attachment_id" {
  description = "Hub egress VPC TGW attachment ID."
  value       = aws_ec2_transit_gateway_vpc_attachment.egress.id
}

output "hub_vpc_id" {
  description = "Hub egress VPC ID."
  value       = aws_vpc.egress.id
}

output "hub_vpc_cidr" {
  description = "Hub egress VPC CIDR block."
  value       = aws_vpc.egress.cidr_block
}

output "hub_public_route_table_id" {
  description = "Hub public route table ID. Per-spoke return routes are added here."
  value       = aws_route_table.public.id
}

output "hub_private_route_table_id" {
  description = "Hub private route table ID used by the TGW attachment subnet."
  value       = aws_route_table.private.id
}

output "hub_test_instance_id" {
  description = "Hub SSM test instance ID."
  value       = aws_instance.test_hub.id
}

