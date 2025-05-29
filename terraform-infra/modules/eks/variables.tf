variable "project" {}
variable "cluster_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "common_tags" {
  type = map(string)
}
