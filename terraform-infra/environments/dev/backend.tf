terraform {
  backend "s3" {
    bucket         = "kbz-infrabucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
