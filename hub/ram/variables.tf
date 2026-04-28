variable "region" {
  description = "AWS region for Hub RAM resources."
  type        = string
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "Optional local AWS CLI profile. Leave null in HCP Terraform when using workspace credentials."
  type        = string
  default     = null
}

variable "hcp_terraform_organization" {
  description = "HCP Terraform organization that owns the upstream Hub core workspace."
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

variable "spoke_account_ids" {
  description = "AWS account IDs allowed to consume the Hub Transit Gateway share."
  type        = set(string)
}

variable "allow_external_principals" {
  description = "Whether the RAM share can be shared outside the Hub AWS Organization."
  type        = bool
  default     = true
}

variable "ram_share_name" {
  description = "Name for the Transit Gateway RAM share."
  type        = string
  default     = "hub-dev-tgw-share"
}

