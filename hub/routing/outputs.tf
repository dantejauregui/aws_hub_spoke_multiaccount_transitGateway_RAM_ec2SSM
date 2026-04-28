output "spoke_tgw_attachment_id" {
  description = "Spoke TGW attachment ID associated with the custom Hub TGW route table."
  value       = data.tfe_outputs.spoke_attach.outputs.tgw_attachment_id
}

output "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR routed back from the Hub public route table."
  value       = data.tfe_outputs.spoke_attach.outputs.spoke_vpc_cidr
}

output "hub_tgw_route_table_id" {
  description = "Hub custom TGW route table used for this Spoke."
  value       = data.tfe_outputs.hub_core.outputs.tgw_route_table_id
}

