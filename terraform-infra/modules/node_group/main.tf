resource "aws_eks_node_group" "spot" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.cluster_name}-spot"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types
  capacity_type  = "SPOT"

  tags = {
    Name = "${var.cluster_name}-spot-node-group"
  }
}
