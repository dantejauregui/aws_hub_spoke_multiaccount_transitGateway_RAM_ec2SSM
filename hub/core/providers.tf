provider "aws" {
  profile = var.aws_profile
  region  = var.region

  default_tags {
    tags = {
      CreatedBy   = "Terraform"
      Environment = "dev"
      Project     = "hub-spoke-networking"
    }
  }
}

