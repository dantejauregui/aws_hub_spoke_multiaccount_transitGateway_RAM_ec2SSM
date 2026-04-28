resource "aws_ram_resource_share" "tgw" {
  name                      = var.ram_share_name
  allow_external_principals = var.allow_external_principals

  tags = {
    Name = var.ram_share_name
  }
}

resource "aws_ram_resource_association" "tgw" {
  resource_arn       = data.tfe_outputs.hub_core.outputs.tgw_arn
  resource_share_arn = aws_ram_resource_share.tgw.arn
}

resource "aws_ram_principal_association" "spokes" {
  for_each = var.spoke_account_ids

  principal          = each.value
  resource_share_arn = aws_ram_resource_share.tgw.arn
}

