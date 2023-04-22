# Terraform Infrastructure Deployment

This repository contains the Terraform code to deploy infrastructure on AWS. It includes creating a VPC with three public and three private subnets, launching EC2 instances in the public subnet as a BastionHost, and creating Private EKS Cluster .

## Architecture

The following diagram represents the architecture of the project:

![image](https://user-images.githubusercontent.com/89076648/233785549-a38c2859-866a-48d1-83be-843e906725aa.png)

## Overview

This project uses Terraform to create the following AWS resources:

- VPC
- Internet Gateway
- Public Route Table
- Private Route Table
- Public EC2 instance
- NatGateway and ElasticIP 
- Security Groups 
- Node group
- EKS role and policy 
- Node Group Role and Policy 
- EKS Cluster

## Getting Started

To get started with this project, clone this repository to your local machine:

```
$ git clone https://github.com/elmansey/Terraform_EKS_Cluster.git
```

## Prerequisites

Before running the deployment script, you will need to have the following:

- AWS account
- Terraform installed on your local machine
- AWS credentials configured on your local machine
- ssh on your local machine to connect to BastionHost to access from it the private cluster
- A Secret Manager in AWS to store aws credentials stored(aws_access_key_idaws_secret_access_key) to but them in bastion host to connect to cluster by it 
- A S3 bucket to store the Terraform state file, and DynamoDB to use for state locking. You can include them in `remoteBackend.tf`

## Installation

1. Navigate to the project directory:

    ```bash
    $ cd Terraform_EKS_Cluster 
    ```

2. Initialize the Terraform configuration:

    ```bash
    $ terraform init
    ```

4. Apply the Terraform configuration:

    ```bash
    $ terraform apply
    ```

## Variables

The following variables can be defined in the terraform.tfvars file:

  - `eksName`: a string representing the EKS name 
  - `node_group_name`: a string representing the node group name 
  - `ami_type`: a string representing the ami type  
  - `capacity_type`: a string representing the capacity type such as ON_DEMAND
  - `disk_size`:  a Number representing the cluster  disk size 
  - `instance_types`:  a list representing the instance type such as `["t2.small"]`
  - `desired_size`:  a Number representing the the desired size for node in cluster
  - `max_size`:  a Number representing the  max_size  cluster node
  - `min_size` : a Number representing the  min_size cluster node
  - `max_unavailable`: a Number representing the max_unavailable node in the cluster 
  # eks network 
  - `public_subnet_cider` : a list representing the public_subnet_cider such as `["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]`
  - `private_subnet_cider` : a list representing the private_subnet_cider such as  `["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]`
  - `availability_zones`  : a  list representing the availability_zones  such as `["us-east-1a", "us-east-1b", "us-east-1c"]` 
  - `prefix`  : a string representing the comany prefix
  - `vpc_cider` : a string representing the vpc_cider such as `"10.0.0.0/16"`
  - `Kubernetes_version`:   a string representing the Kubernetes_version such as `"1.25"`
  # bastion 
  - `instance_type`: a string representing the instance type such as `"t2.small"`
  - `region`: a string representing the region such as `"us-east-1"`
  - `terraform_user_secret_arn`: a string representing the terraform user secret arn 





## Conclusion

With this Terraform code, you can create a VPC with three public and three private subnets in three different availability zones, launch EC2 instance as a bastionHost for accessing the private cluster.

## Author

- [Abdelrahman Elmansey ](https://www.linkedin.com/in/abdelrahman-elmansey/)