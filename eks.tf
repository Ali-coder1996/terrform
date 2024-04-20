resource "aws_eks_cluster" "my_cluster" {
  name     = "iih-eks-cluster-${var.environment}"
  role_arn = aws_iam_role.iih-eks-cluster-service-role.arn
  version  = "1.28" # Change this to your desired EKS version

  vpc_config {
    subnet_ids = var.eksSubnets
    endpoint_public_access  = true
  }

  tags = {
      "Name" = "iih"
  }

  depends_on = [
    aws_iam_role_policy_attachment.iih-eks-cluster-service-role-eks-cluster-policy-attachment,
    aws_iam_role_policy_attachment.iih-eks-cluster-service-role-eks-service-policy-attachment,
    aws_iam_role_policy_attachment.iih-eks-cluster-service-role-ecr-full-access-policy-attachment
  ]
}


