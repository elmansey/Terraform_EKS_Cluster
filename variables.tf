# network module 
variable public_subnet_cider {type=list}
variable private_subnet_cider {type=list}
variable availability_zones {type=list}
variable prefix {type=string}
variable vpc_cider {type=string}
variable region {type=string}
# eks module 
variable eksName {type=string}
variable node_group_name {type=string}
variable ami_type {type=string}
variable capacity_type {type=string}
variable instance_types {type=list}
variable disk_size {type=number}
variable desired_size {type=number}
variable max_size {type=number}
variable min_size {type=number}
variable max_unavailable {type=number}
variable Kubernetes_version {type=string}

# bastion 
variable instance_type {type=string}
variable terraform_user_secret_arn {type=string}















