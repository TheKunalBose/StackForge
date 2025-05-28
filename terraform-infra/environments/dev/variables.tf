# ---------------------------------------------------------------------------------------------------------------------
# COMMON VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "project" {
  description = "Project name used as a prefix for resources"
  type        = string
  default     = "stackforge"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    Environment = "development"
    Project     = "StackForge"
    ManagedBy   = "Terraform"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# VPC/NETWORKING VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
}

variable "azs" {
  description = "The availability zones to deploy resources in"
  type        = list(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# EKS VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version to use for the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations"
  type        = string
}

variable "node_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role that provides permissions for the EKS Node Group"
  type        = string
}

variable "desired_size" {
  description = "The desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "The maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "The minimum number of worker nodes"
  type        = number
}

variable "instance_types" {
  description = "The instance types to use for the worker nodes"
  type        = list(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# JENKINS VARIABLES
# ---------------------------------------------------------------------------------------------------------------------
variable "jenkins_ami_id" {
  description = "The ID of the AMI to use for the Jenkins instance"
  type        = string
}

variable "jenkins_instance_type" {
  description = "The instance type to use for the Jenkins instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "jenkins_sg_id" {
  description = "The ID of the security group to use for the Jenkins instance"
  type        = string
}
