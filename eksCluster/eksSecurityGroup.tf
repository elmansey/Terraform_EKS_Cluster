resource "aws_security_group" "eks_cluster_sg" {
  name_prefix = "eks_cluster_sg"
  vpc_id      = module.network.vpc_id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    security_groups = [aws_security_group.allow_ssh.id]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks_cluster_sg"
  }
}

