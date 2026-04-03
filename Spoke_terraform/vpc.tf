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
