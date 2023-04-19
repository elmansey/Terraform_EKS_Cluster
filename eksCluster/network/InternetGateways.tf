resource "aws_internet_gateway" "master_igw" {
  vpc_id = aws_vpc.master_vpc.id
  tags = {
    Name = "master_igw"
  }
}