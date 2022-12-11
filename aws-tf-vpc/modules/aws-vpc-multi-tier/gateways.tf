resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge({ Name = "${var.vpc_name}-igtw" }, var.tags)
}

resource "aws_eip" "nat_1a" {
  tags = merge({ Name = "${var.vpc_name}-nat-1a" }, var.tags)
}

resource "aws_eip" "nat_1b" {
  tags = merge({ Name = "${var.vpc_name}-nat-1a" }, var.tags)
}

resource "aws_eip" "nat_1c" {
  tags = merge({ Name = "${var.vpc_name}-nat-1a" }, var.tags)
}

resource "aws_nat_gateway" "private_1a" {
  allocation_id = aws_eip.nat_1a.id
  subnet_id     = aws_subnet.sn_web_a.id

  tags = merge({ Name = "${var.vpc_name}-nat-1a" }, var.tags)

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.public]
}

resource "aws_nat_gateway" "private_1b" {
  allocation_id = aws_eip.nat_1b.id
  subnet_id     = aws_subnet.sn_web_b.id

  tags = merge({ Name = "${var.vpc_name}-nat-1b" }, var.tags)

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.public]
}

resource "aws_nat_gateway" "private_1c" {
  allocation_id = aws_eip.nat_1c.id
  subnet_id     = aws_subnet.sn_web_c.id

  tags = merge({ Name = "${var.vpc_name}-nat-1c" }, var.tags)

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.public]
}