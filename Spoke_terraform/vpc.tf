resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "dev-private"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.1.2.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dev-public"
  }
}

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "dev" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.dev]
}
