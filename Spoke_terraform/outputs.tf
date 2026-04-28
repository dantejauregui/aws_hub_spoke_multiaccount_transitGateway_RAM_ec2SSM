output "instance_id" {
  description = "EC2 id with SSM Connection"
  value       = aws_instance.test.id
}
output "tgw_attachment_id" {
  description = "Transit Gateway VPC attachment ID for the Dev Spoke VPC that will be use in the Hub account with the  aws_ec2_transit_gateway_vpc_attachment_accepter"
  value       = aws_ec2_transit_gateway_vpc_attachment.dev.id
}
