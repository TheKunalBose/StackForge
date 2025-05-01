variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "prod-vpc"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  default     = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
}

variable "azs" {
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "cluster_name" {
  description = "EKS Cluster name"
  default     = "prod-eks-cluster"
}

variable "cluster_version" {
  description = "EKS Cluster Kubernetes version"
  default     = "1.28"
}

variable "node_role_arn" {
  description = "IAM role ARN for EKS node group"
  default     = "arn:aws:iam::123456789012:role/ProdEKSNodeRole"
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  default     = 4
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  default     = 6
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  default     = 3
}

variable "instance_types" {
  description = "List of EC2 instance types for nodes"
  default     = ["m5.large", "t3.large"]
}

variable "jenkins_ami_id" {
  description = "AMI ID for Jenkins EC2"
  default     = "ami-0c02fb55956c7d316"
}

variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins"
  default     = "t3.large"
}

variable "key_name" {
  description = "SSH key name"
  default     = "prod-keypair"
}

variable "jenkins_sg_id" {
  description = "Security Group ID for Jenkins"
  default     = "sg-prod123456789"
}
