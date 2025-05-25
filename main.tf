# Terraform configuration block
terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  region = "us-west-2"  # Default region, can be overridden with environment variables
  
  # Optional configuration for profiles, assuming credentials are set via environment variables or AWS CLI
  # profile = "default"
  
  default_tags {
    tags = {
      Environment = "development"
      Project     = "StackForge"
      ManagedBy   = "Terraform"
    }
  }
}

# Variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "stackforge-vpc"
}

# VPC Resource
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = {
    Name = var.vpc_name
  }
}

# Subnet Resource
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}a"
  
  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

# Data source to get current region details
data "aws_region" "current" {}

# Output values
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.public.id
}

