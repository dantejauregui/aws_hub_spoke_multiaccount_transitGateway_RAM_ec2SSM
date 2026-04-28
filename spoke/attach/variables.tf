variable "region" {
  description = "AWS region for the Spoke resources."
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

variable "hub_ram_workspace_name" {
  description = "Workspace name that owns the Hub RAM share state."
  type        = string
  default     = "hub-dev-ram"
}

variable "name" {
  description = "Name prefix for Spoke resources."
  type        = string
  default     = "infra-dev"
}

variable "spoke_vpc_cidr" {
  description = "CIDR block for this Spoke VPC."
  type        = string
  default     = "10.1.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the Spoke private subnet."
  type        = string
  default     = "10.1.1.0/24"
}

variable "availability_zone_suffix" {
  description = "Availability Zone suffix used with var.region, for example 'a'."
  type        = string
  default     = "a"
}

variable "accept_ram_share" {
  description = "Set true if the Spoke account must explicitly accept the RAM share invitation."
  type        = bool
  default     = false
}

variable "test_instance_type" {
  description = "Instance type for the Spoke SSM test instance."
  type        = string
  default     = "t2.micro"
}

