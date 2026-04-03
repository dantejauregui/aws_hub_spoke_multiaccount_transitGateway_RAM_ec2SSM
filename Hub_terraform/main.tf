terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider using the "default" profile located in my ~/.aws/credentials, and adding Tags:
provider "aws" {
  profile = "default"
  region  = "eu-central-1"

  default_tags {
    tags = {
      CreatedBy = "Terraform"
    }
  }
}

locals {
  name = "central-egress"
}
