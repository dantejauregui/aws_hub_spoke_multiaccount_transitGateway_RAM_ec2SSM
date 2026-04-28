resource "aws_vpc" "egress" {
  cidr_block           = var.hub_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.egress.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.egress.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = local.availability_zone

  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.egress.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = local.availability_zone

  tags = {
    Name = "${var.name}-private"
  }
}

