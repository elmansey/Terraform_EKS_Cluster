resource "aws_eks_node_group" "eksClusterNodeGroup" {
  cluster_name    = aws_eks_cluster.eksCluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.AmazonEKSNodeRole.arn
  subnet_ids      = module.network.private_subnet_ids[*]
  ami_type = var.ami_type
  capacity_type = var.capacity_type
  disk_size = var.disk_size
  instance_types = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  update_config {
    max_unavailable = var.max_unavailable
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicyAttachment,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnlyPolicyAttachment,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_PolicyAttachment
  ]
}