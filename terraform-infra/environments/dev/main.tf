provider "aws" {
  region = "us-east-1"
  # Using default profile which is already configured for account 782815632884
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  project  = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "igw" {
  source  = "../../modules/igw"
  vpc_id  = module.vpc.vpc_id
  project = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "subnet_1" {
  source              = "../../modules/subnets"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidrs[0]
  private_subnet_cidr = var.private_subnet_cidrs[0]
  az                  = var.azs[0]
  project             = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "subnet_2" {
  source              = "../../modules/subnets"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidrs[1]
  private_subnet_cidr = var.private_subnet_cidrs[1]
  az                  = var.azs[1]
  project             = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "nat" {
  source           = "../../modules/nat"
  public_subnet_id = module.subnet_1.public_subnet_id
  project          = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "route_tables_1" {
  source            = "../../modules/route_tables"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.igw.igw_id
  nat_gateway_id    = module.nat.nat_gateway_id
  public_subnet_id  = module.subnet_1.public_subnet_id
  private_subnet_id = module.subnet_1.private_subnet_id
  project           = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "route_tables_2" {
  source            = "../../modules/route_tables"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.igw.igw_id
  nat_gateway_id    = module.nat.nat_gateway_id
  public_subnet_id  = module.subnet_2.public_subnet_id
  private_subnet_id = module.subnet_2.private_subnet_id
  project           = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}

module "eks" {
  source           = "../../modules/eks"
  cluster_role_arn = var.cluster_role_arn
  subnet_ids = [
    module.subnet_1.public_subnet_id,
    module.subnet_2.public_subnet_id,
    module.subnet_1.private_subnet_id,
    module.subnet_2.private_subnet_id
  ]
  project = "dev"
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
  depends_on = [
    module.vpc,
    module.subnet_1,
    module.subnet_2
  ]
}

module "node_group" {
  source        = "../../modules/node_group"
  cluster_name  = module.eks.eks_cluster_name
  node_role_arn = var.node_role_arn
  private_subnet_ids = [
    module.subnet_1.private_subnet_id,
    module.subnet_2.private_subnet_id
  ]
  desired_size   = var.desired_size != null ? var.desired_size : 2
  max_size       = var.max_size != null ? var.max_size : 4
  min_size       = var.min_size != null ? var.min_size : 2
  instance_types = var.instance_types != null ? var.instance_types : ["t3.medium", "t3.large"]

  depends_on = [
    module.eks,
    module.vpc,
    module.subnet_1,
    module.subnet_2
  ]
}

# TODO: Create the EC2 module before uncommenting the Jenkins module
# The EC2 module is missing at ../../modules/ec2
/*
module "jenkins" {
  source              = "../../modules/ec2"
  ami_id              = var.jenkins_ami_id
  instance_type       = var.jenkins_instance_type
  subnet_id           = module.subnet_1.public_subnet_id
  key_name            = var.key_name
  security_group_id   = var.jenkins_sg_id
  project             = "dev"
  common_tags         = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "StackForge"
  }
}
*/
