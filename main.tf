module eksCluster {
  source = "./eksCluster"
  eksName= var.eksName
  node_group_name=var.node_group_name
  ami_type = var.ami_type
  capacity_type = var.capacity_type
  disk_size = var.disk_size
  instance_types = var.instance_types
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
  max_unavailable=var.max_unavailable
  # eks network 
  public_subnet_cider  = var.public_subnet_cider
  private_subnet_cider  = var.private_subnet_cider
  availability_zones  = var.availability_zones
  prefix  = var.prefix
  vpc_cider  = var.vpc_cider
  Kubernetes_version=var.Kubernetes_version
  # bastion 
  instance_type = var.instance_type
  region = var.region
  terraform_user_secret_arn = var.terraform_user_secret_arn
}