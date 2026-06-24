locals {
  ami = data.aws_ami.ubuntu.id
  common_tags = {
    Project = var.project
    Environment = var.environment
    Purpose = var.purpose
  }
}