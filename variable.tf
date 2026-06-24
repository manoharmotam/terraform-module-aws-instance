variable "ami" {
  default = {}
}

variable "instance_type" {
  
  default = "t3.micro"
  validation {
    condition = contains(["t3.micro", "c7i-flex.large"], var.instance_type)
    error_message = "The instance size can be either 't3.micro' or 'c7i-flex.large'."
  }
}
variable "project" {
  default = "mrmotam"
}

variable "environment" {
  default = "dev"
}

variable "ec2_tags" {
    default = {}
}

variable "purpose" {
  default = {}
}

variable "sg_tags" {
    default = {}
}

variable "ports" {
    default = {
        ssh = 22
        cidr = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "TCP"
    }
}