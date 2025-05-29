resource "aws_eks_cluster" "eks" {
  name     = "${var.project}-eks"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = var.common_tags
}
