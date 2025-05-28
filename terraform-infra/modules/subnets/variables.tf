variable "vpc_id" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "az" {}
variable "project" {}
variable "common_tags" {
  type = map(string)
}

### 📁 modules/subnets/outputs.tf

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}
