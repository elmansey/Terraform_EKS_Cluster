resource "aws_iam_role" "AmazonEKSNodeRole" {
  name = "AmazonEKSNodeRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}


# attach AmazonEKSWorkerNodePolicy to this role 
resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

# attach AmazonEC2ContainerRegistryReadOnly policy to this role 
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnlyPolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

# attach AmazonEKS_CNI_Policy to this role 
resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_PolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.AmazonEKSNodeRole.name
}