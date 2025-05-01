provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "eks" {
  source              = "../../modules/eks"
  cluster_name        = var.cluster_name
  cluster_version     = var.cluster_version
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
}

module "node_group" {
  source              = "../../modules/node_group"
  cluster_name        = var.cluster_name
  node_role_arn       = var.node_role_arn
  private_subnet_ids  = module.vpc.private_subnet_ids
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  instance_types      = var.instance_types
}

module "cicd" {
  source             = "../../modules/cicd"
  ami_id             = var.jenkins_ami_id
  instance_type      = var.jenkins_instance_type
  subnet_id          = module.vpc.public_subnet_ids[0]
  key_name           = var.key_name
  security_group_id  = var.jenkins_sg_id
}
s