variable "vpc_id" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "az" {}
variable "project" {}
variable "common_tags" {
  type = map(string)
}
