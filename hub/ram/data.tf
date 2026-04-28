data "tfe_outputs" "hub_core" {
  config = {
    organization = var.hcp_terraform_organization
    workspaces = {
      name = var.hub_core_workspace_name
    }
  }
}

