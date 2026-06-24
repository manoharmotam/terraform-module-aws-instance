resource "aws_instance" "main" {
    ami = local.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.main.id]

    tags = merge(var.ec2_tags, local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        }
    )
}

resource "aws_security_group" "main" {
    name = "${var.project}-${var.environment}"

    ingress {
        from_port = var.ports.ssh
        to_port = var.ports.ssh
        cidr_blocks = var.ports.cidr
        protocol = var.ports.protocol
    }

    egress {
        from_port = var.ports.from_port
        to_port = var.ports.to_port
        cidr_blocks = var.ports.cidr
        protocol = "-1"
    }

    tags = merge(var.ec2_tags, local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        })
}