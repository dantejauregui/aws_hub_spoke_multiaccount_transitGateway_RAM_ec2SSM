output "spoke_vpc_id" {
  description = "Spoke VPC ID."
  value       = aws_vpc.spoke.id
}

output "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR block."
  value       = aws_vpc.spoke.cidr_block
}

output "spoke_private_route_table_id" {
  description = "Spoke private route table ID."
  value       = aws_route_table.private.id
}

output "tgw_attachment_id" {
  description = "Transit Gateway VPC attachment ID for this Spoke VPC."
  value       = aws_ec2_transit_gateway_vpc_attachment.spoke.id
}

output "instance_id" {
  description = "Spoke SSM test instance ID."
  value       = aws_instance.test.id
}

