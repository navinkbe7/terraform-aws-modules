resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = merge({ Name = "${var.vpc_name}-public" }, var.tags)
}

resource "aws_route_table_association" "sn_web_a" {
  subnet_id      = aws_subnet.sn_web_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "sn_web_b" {
  subnet_id      = aws_subnet.sn_web_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "sn_web_c" {
  subnet_id      = aws_subnet.sn_web_c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.private_1a.id
  }

  tags = merge({ Name = "${var.vpc_name}-private-1a" }, var.tags)
}

resource "aws_route_table_association" "sn_app_a" {
  subnet_id      = aws_subnet.sn_app_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "sn_db_a" {
  subnet_id      = aws_subnet.sn_db_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.private_1b.id
  }

  tags = merge({ Name = "${var.vpc_name}-private-1b" }, var.tags)
}

resource "aws_route_table_association" "sn_app_b" {
  subnet_id      = aws_subnet.sn_app_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "sn_db_" {
  subnet_id      = aws_subnet.sn_db_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private_1c" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.private_1c.id
  }

  tags = merge({ Name = "${var.vpc_name}-private-1c" }, var.tags)
}

resource "aws_route_table_association" "sn_app_c" {
  subnet_id      = aws_subnet.sn_app_c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "sn_db_c" {
  subnet_id      = aws_subnet.sn_db_c.id
  route_table_id = aws_route_table.public.id
}