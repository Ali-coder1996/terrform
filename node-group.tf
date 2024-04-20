resource "aws_eks_node_group" "iih-eks-cluster-infra-mgmt-node-group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "iih-${var.environment}-eks-cluster-node-group"
  node_role_arn   = aws_iam_role.iih-eks-cluster-node-group-service-role.arn
  subnet_ids      = var.eksSubnets

  scaling_config {
    desired_size = var.eksInfraMgmtDesiredNodes
    min_size     = var.eksInfraMgmtMinNodes
    max_size     = var.eksInfraMgmtMaxNodes
  }

  disk_size = var.eksInfraMgmtNodeDiskSize
  instance_types = var.eksInfraMgmtInstanceType

  update_config {
    max_unavailable = 1
  }

  labels = {
    name = var.eksInfraMgmtNodesLabel
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.iih-eks-cluster-node-group-service-role-eks-worker-policy-attachment,
    aws_iam_role_policy_attachment.iih-eks-cluster-node-group-service-role-ec2-full-access-policy-attachment,
    aws_iam_role_policy_attachment.iih-eks-cluster-node-group-service-rolee-ecr-full-access-policy-attachment,
    aws_iam_role_policy_attachment.iih-eks-cluster-node-group-service-role-cni-policy-attachment
  ]

  tags = {
    Name        = "iih-${var.environment}-eks-cluster-infra-mgmt-node-group"
    Environment = var.tagEnvironment
    Terraform   = "True"
  }
}