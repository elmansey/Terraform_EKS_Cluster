resource "aws_eks_cluster" "eksCluster" {
  name     = var.eksName
  role_arn = aws_iam_role.eksClusterRole.arn
  version = var.Kubernetes_version
  enabled_cluster_log_types = ["api","authenticator"]
  vpc_config {
    endpoint_private_access = true
    endpoint_public_access = false
    subnet_ids = module.network.private_subnet_ids[*]
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }
  depends_on = [aws_iam_role_policy_attachment.eksClusterRolePolicyAttachment ]
}
