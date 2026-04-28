data "tfe_outputs" "hub_core" {
  config = {
    organization = var.hcp_terraform_organization
    workspaces = {
      name = var.hub_core_workspace_name
    }
  }
}

data "tfe_outputs" "hub_ram" {
  config = {
    organization = var.hcp_terraform_organization
    workspaces = {
      name = var.hub_ram_workspace_name
    }
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }
}

