variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "dev-vpc"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "cluster_name" {
  default = "dev-eks-cluster"
}

variable "cluster_version" {
  default = "1.28"
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS node group"
  default     = "arn:aws:iam::123456789012:role/EKSNodeRole"
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 4
}

variable "min_size" {
  default = 1
}

variable "instance_types" {
  default = ["t3.medium", "t3a.medium"]
}

variable "jenkins_ami_id" {
  default = "ami-0c02fb55956c7d316" # Example Amazon Linux 2 AMI in us-east-1
}

variable "jenkins_instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "my-keypair"
}

variable "jenkins_sg_id" {
  default = "sg-0123456789abcdef0"
}
