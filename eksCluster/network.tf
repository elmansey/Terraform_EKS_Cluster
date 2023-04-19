module "network" {
  source = "./network"
  public_subnet_cider = var.public_subnet_cider
  private_subnet_cider = var.private_subnet_cider
  availability_zones = var.availability_zones
  prefix = var.prefix
  vpc_cider = var.vpc_cider
}