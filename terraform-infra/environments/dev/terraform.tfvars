vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-vpc"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
azs                  = ["us-east-1a", "us-east-1b"]

cluster_name    = "dev-eks-cluster"
cluster_version = "1.28"
cluster_role_arn = "arn:aws:iam::782815632884:role/EKSClusterRole"

node_role_arn  = "arn:aws:iam::782815632884:role/EKSNodeRole"
desired_size   = 2
max_size       = 4
min_size       = 1
instance_types = ["t3.medium"]

jenkins_ami_id        = "ami-0c02fb55956c7d316"
jenkins_instance_type = "t2.medium"
key_name              = "my-keypair"
jenkins_sg_id         = "sg-0123456789abcdef0"
