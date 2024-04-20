/* CLUSTER OUTPUT */
output "iih-eks-cluster-service-role-id" {
  description = "SMBU MP EKS Cluster service role ID"
  value       = aws_iam_role.iih-eks-cluster-service-role.id
}

output "iih-eks-cluster-service-role-arn" {
  description = "SMBU MP EKS Cluster service role ARN"
  value       = aws_iam_role.iih-eks-cluster-service-role.arn
}

output "iih-eks-cluster-service-role-name" {
  description = "SMBU MP EKS Cluster service role name"
  value       = aws_iam_role.iih-eks-cluster-service-role.name
}

/* NODE GROUP OUTPUT */
output "iih-eks-cluster-node-group-service-role-id" {
  description = "SMBU MP EKS Cluster Node Group service role ID"
  value       = aws_iam_role.iih-eks-cluster-node-group-service-role.id
}

output "iih-eks-cluster-node-group-service-role-arn" {
  description = "SMBU MP EKS Cluster Node Group service role ARN"
  value       = aws_iam_role.iih-eks-cluster-node-group-service-role.arn
}

output "iih-eks-cluster-node-group-service-role-name" {
  description = "SMBU MP EKS Cluster Node Group service role name"
  value       = aws_iam_role.iih-eks-cluster-node-group-service-role.name
}


