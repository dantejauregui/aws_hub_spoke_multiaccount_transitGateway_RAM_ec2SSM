output "ram_share_arn" {
  description = "RAM share ARN for the Hub Transit Gateway."
  value       = aws_ram_resource_share.tgw.arn
}

output "shared_tgw_arn" {
  description = "Transit Gateway ARN associated with the RAM share."
  value       = data.tfe_outputs.hub_core.outputs.tgw_arn
}

output "spoke_account_ids" {
  description = "Spoke AWS account IDs associated with the RAM share."
  value       = sort(tolist(var.spoke_account_ids))
}

