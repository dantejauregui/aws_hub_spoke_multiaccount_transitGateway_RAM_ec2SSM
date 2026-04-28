resource "aws_vpc" "spoke" {
  cidr_block           = var.spoke_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.spoke.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = local.availability_zone

  tags = {
    Name = "${var.name}-private"
  }
}

