resource "aws_vpc" "main" {
  cidr_block       = "10.16.0.0/16"
  instance_tenancy = "default"

  tags = merge({ Name = var.vpc_name }, var.tags)
}

# US-EAST-1A
resource "aws_subnet" "sn_reserved_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.0.0/20"
  availability_zone = "us-east-1a"

  tags = merge({ Name = "sn-reserved-A" }, var.tags)
}

resource "aws_subnet" "sn_db_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.16.0/20"
  availability_zone = "us-east-1a"

  tags = merge({ Name = "sn-db-A" }, var.tags)
}

resource "aws_subnet" "sn_app_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.32.0/20"
  availability_zone = "us-east-1a"
  
  tags = merge({ Name = "sn-app-A" }, var.tags)
}

resource "aws_subnet" "sn_web_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.16.48.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = merge({ Name = "sn-web-A" }, var.tags)
}

# US-EAST-1B
resource "aws_subnet" "sn_reserved_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.64.0/20"
  availability_zone = "us-east-1b"

  tags = merge({ Name = "sn-reserved-B" }, var.tags)
}

resource "aws_subnet" "sn_db_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.80.0/20"
  availability_zone = "us-east-1b"

  tags = merge({ Name = "sn-db-B" }, var.tags)
}

resource "aws_subnet" "sn_app_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.96.0/20"
  availability_zone = "us-east-1b"

  tags = merge({ Name = "sn-app-B" }, var.tags)
}

resource "aws_subnet" "sn_web_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.16.112.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = merge({ Name = "sn-web-B" }, var.tags)
}

# US-EAST-1B
resource "aws_subnet" "sn_reserved_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.128.0/20"
  availability_zone = "us-east-1c"

  tags = merge({ Name = "sn-reserved-C" }, var.tags)
}

resource "aws_subnet" "sn_db_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.144.0/20"
  availability_zone = "us-east-1c"

  tags = merge({ Name = "sn-db-C" }, var.tags)
}

resource "aws_subnet" "sn_app_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.160.0/20"
  availability_zone = "us-east-1c"

  tags = merge({ Name = "sn-app-C" }, var.tags)
}

resource "aws_subnet" "sn_web_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.16.176.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = merge({ Name = "sn-web-C" }, var.tags)
}