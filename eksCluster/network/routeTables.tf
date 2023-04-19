resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.master_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.master_igw.id
  }
  tags = {
    Name = "${var.prefix}_public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.master_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.master_ngw.id
  }
  tags = {
    Name = "${var.prefix}_private_route_table"
  }
}