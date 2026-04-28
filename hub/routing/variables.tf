variable "region" {
  description = "AWS region for Hub routing resources."
  type        = string
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "Optional local AWS CLI profile. Leave null in HCP Terraform when using workspace credentials."
  type        = string
  default     = null
}

variable "hcp_terraform_organization" {
  description = "HCP Terraform organization that owns the upstream workspaces."
  type        = string
}

variable "hcp_terraform_hostname" {
  description = "HCP Terraform hostname."
  type        = string
  default     = "app.terraform.io"
}

variable "hub_core_workspace_name" {
  description = "Workspace name that owns the Hub core state."
  type        = string
  default     = "hub-dev-core"
}

variable "spoke_attach_workspace_name" {
  description = "Workspace name that owns this Spoke attachment state."
  type        = string
  default     = "infra-dev-attach"
}

variable "name" {
  description = "Name prefix for per-spoke Hub routing resources."
  type        = string
  default     = "infra-dev"
}

