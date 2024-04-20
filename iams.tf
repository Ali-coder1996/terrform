/*************** IIH EKS Cluster Service Role ****************/
resource "aws_iam_role" "iih-eks-cluster-service-role" {
  name = "iih-${var.environment}-eks-cluster-service-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      }
    }
  ]
}
EOF
  tags = {
    Name        = "iih-${var.environment}-eks-cluster-service-role"
    Environment = var.tagEnvironment
    Terraform   = "True"
  }
}

resource "aws_iam_role_policy_attachment" "iih-eks-cluster-service-role-eks-cluster-policy-attachment" {
  role       = aws_iam_role.iih-eks-cluster-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "iih-eks-cluster-service-role-eks-service-policy-attachment" {
  role       = aws_iam_role.iih-eks-cluster-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role_policy_attachment" "iih-eks-cluster-service-role-ecr-full-access-policy-attachment" {
  role       = aws_iam_role.iih-eks-cluster-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}




/*************** IIH EKS Cluster Node Group Service Role ****************/
resource "aws_iam_role" "iih-eks-cluster-node-group-service-role" {
  name = "iih-${var.environment}-eks-cluster-node-group-service-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
  tags = {
    Name        = "iih-${var.environment}-eks-cluster-node-group-service-role"
    Environment = var.tagEnvironment
    Terraform   = "True"
  }
}


resource "aws_iam_role_policy_attachment" "iih-eks-cluster-node-group-service-role-eks-worker-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.iih-eks-cluster-node-group-service-role.name
}

resource "aws_iam_role_policy_attachment" "iih-eks-cluster-node-group-service-role-ec2-full-access-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.iih-eks-cluster-node-group-service-role.name
}

resource "aws_iam_role_policy_attachment" "iih-eks-cluster-node-group-service-rolee-ecr-full-access-policy-attachment" {
  role       = aws_iam_role.iih-eks-cluster-node-group-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "iih-eks-cluster-node-group-service-role-cni-policy-attachment" {
  role       = aws_iam_role.iih-eks-cluster-node-group-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

