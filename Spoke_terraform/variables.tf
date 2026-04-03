variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

# CRITICAL: from NET account output
variable "tgw_id" {
  description = "Transit Gateway ID from NET account"
}
