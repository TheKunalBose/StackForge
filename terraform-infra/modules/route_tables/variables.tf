variable "vpc_id" {}
variable "igw_id" {}
variable "nat_gateway_id" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "project" {}
variable "common_tags" {
  type = map(string)
}
