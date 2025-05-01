module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.private_subnet_ids
  vpc_id          = var.vpc_id

  manage_aws_auth = true

  # Additional configurations as needed
}
