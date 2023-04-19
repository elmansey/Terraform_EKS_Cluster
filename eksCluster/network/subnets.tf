resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.master_vpc.id
  count = length(var.public_subnet_cider)
  availability_zone = var.availability_zones[count.index]
  cidr_block = var.public_subnet_cider[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}_public_subnet_${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.master_vpc.id
  count = length(var.private_subnet_cider)
  availability_zone = var.availability_zones[count.index]
  cidr_block = var.private_subnet_cider[count.index]
  tags = {
    Name = "${var.prefix}_private_subnet_${count.index}"
  }
}
