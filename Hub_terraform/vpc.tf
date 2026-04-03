resource "aws_vpc" "egress" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${local.name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.egress.id

  tags = {
    Name = "${local.name}-igw"
  }
}

# Public subnet (for NAT)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.egress.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${local.name}-public"
  }
}

# Private subnet (for TGW attachment)
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.egress.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "${local.name}-private"
  }
}
