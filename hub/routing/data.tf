data "tfe_outputs" "hub_core" {
  config = {
    organization = var.hcp_terraform_organization
    workspaces = {
      name = var.hub_core_workspace_name
    }
  }
}

data "tfe_outputs" "spoke_attach" {
  config = {
    organization = var.hcp_terraform_organization
    workspaces = {
      name = var.spoke_attach_workspace_name
    }
  }
}

