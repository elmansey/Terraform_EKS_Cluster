resource "aws_vpc" "master_vpc" {
  cidr_block = var.vpc_cider
  enable_dns_hostnames = true
  tags = {
    Name = "${var.prefix}_master_vpc"
  }
}