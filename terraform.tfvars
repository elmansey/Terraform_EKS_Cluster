# network module 
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cider  = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"] 
private_subnet_cider = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
prefix = "EKS"
vpc_cider = "10.0.0.0/16"
region = "us-east-1"
# eks module
eksName="eksCluster"
node_group_name = "eksClusterNodeGroup"
ami_type = "AL2_x86_64"
capacity_type = "ON_DEMAND"
disk_size = 20
instance_types = ["t2.small"]
desired_size= 3
max_size= 3
min_size= 3
max_unavailable=1
Kubernetes_version="1.25"

# bastion 
instance_type ="t2.micro"
# bastion data source to retrive secret data 
terraform_user_secret_arn="arn:aws:secretsmanager:us-east-1:444914955836:secret:terraform_user-UfNCLS"