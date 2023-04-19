data "aws_secretsmanager_secret" "user_credentials" {
  arn = var.terraform_user_secret_arn

}

data "aws_secretsmanager_secret_version" "secret_version" {
  secret_id = data.aws_secretsmanager_secret.user_credentials.id
}


resource "aws_instance" "bastionHost" {
  ami           = data.aws_ami.ubuntu.id                    
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id = module.network.public_subnet_ids[1]
  key_name = aws_key_pair.tf-key-pair.id
  user_data = <<-EOF
              #!/bin/bash
                sudo apt-get update
                sudo apt-get install -y ca-certificates curl 
                sudo apt-get install -y apt-transport-https
                sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
                echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
                sudo apt-get update
                VERSION=1.25.0-00
                sudo apt-get install -y kubectl=$VERSION
                sudo apt install unzip -y 
                sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.8.9.zip" -o "awscliv2.zip"
                sudo unzip awscliv2.zip
                sudo ./aws/install
                sudo mkdir /home/ubuntu/.aws/
                sudo touch /home/ubuntu/.aws/credentials
                echo "[default]" > /home/ubuntu/.aws/credentials
                echo "aws_access_key_id = ${jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["aws_access_key_id"]}" >> /home/ubuntu/.aws/credentials
                echo "aws_secret_access_key = ${jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["aws_secret_access_key"]}" >> /home/ubuntu/.aws/credentials
                aws eks update-kubeconfig --region us-east-1 --name eksCluster
             EOF

  tags = {
    Name = "bastionHost"
  }
}
