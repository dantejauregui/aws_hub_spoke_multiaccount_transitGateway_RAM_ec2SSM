resource "aws_iam_role" "ssm_role" {
  name = "${var.name}-ssm-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.name}-ssm-instance-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_security_group" "ec2" {
  name        = "${var.name}-ssm-test-sg"
  description = "Allow outbound traffic from the Spoke SSM test instance"
  vpc_id      = aws_vpc.spoke.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-ssm-test-sg"
  }
}

resource "aws_instance" "test" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.test_instance_type
  subnet_id                   = aws_subnet.private.id
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "${var.name}-ssm-test-instance"
  }
}

