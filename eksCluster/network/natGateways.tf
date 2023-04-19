resource "aws_eip" "master_eip" {
  vpc      = true
  tags = {
    Name = "master_eip"
  }
}
resource "aws_nat_gateway" "master_ngw" {
  allocation_id = aws_eip.master_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "${var.prefix}_nat_gateway"
  }
  depends_on = [aws_internet_gateway.master_igw]
}