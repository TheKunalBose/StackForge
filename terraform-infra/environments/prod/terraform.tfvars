vpc_cidr             = "10.1.0.0/16"
vpc_name             = "prod-vpc"

public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]

cluster_name         = "prod-eks-cluster"
cluster_version      = "1.28"

node_role_arn        = "arn:aws:iam::123456789012:role/ProdEKSNodeRole"
desired_size         = 4
max_size             = 6
min_size             = 3
instance_types       = ["m5.large", "t3.large"]

jenkins_ami_id       = "ami-0c02fb55956c7d316"
jenkins_instance_type = "t3.large"
key_name             = "prod-keypair"
jenkins_sg_id        = "sg-prod123456789"
