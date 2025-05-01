resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  user_data = file("${path.module}/scripts/install_jenkins.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}
