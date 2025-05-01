variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the IAM role for the node group"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
}
