variable "region" {
  description = "AWS region for the Hub networking resources."
  type        = string
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "Optional local AWS CLI profile. Leave null in HCP Terraform when using workspace credentials."
  type        = string
  default     = null
}

variable "name" {
  description = "Name prefix for Hub core resources."
  type        = string
  default     = "central-egress"
}

variable "hub_vpc_cidr" {
  description = "CIDR block for the Hub egress VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the Hub public subnet that hosts the NAT Gateway."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the Hub private subnet used by the TGW attachment and test instance."
  type        = string
  default     = "10.0.10.0/24"
}

variable "availability_zone_suffix" {
  description = "Availability Zone suffix used with var.region, for example 'a'."
  type        = string
  default     = "a"
}

variable "test_instance_type" {
  description = "Instance type for the Hub SSM test instance."
  type        = string
  default     = "t2.micro"
}

