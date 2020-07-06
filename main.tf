provider "aws" {
  region = var.region
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "openstack" {
  name        = "openstack"
  description = "OPENSTack"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Allow All Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "controller" {
  count                  = 2
  ami                    = var.ubuntu_ami
  instance_type          = "t3.large"
  key_name               = "default-ec2"
  subnet_id              = tolist(data.aws_subnet_ids.default.ids)[0]
  vpc_security_group_ids = [aws_security_group.openstack.id]
  tags = {
    Name = var.node_name[count.index]
  }
}

resource "aws_network_interface" "test" {
  count = 2
  subnet_id       = tolist(data.aws_subnet_ids.default.ids)[0]
  security_groups = ["${aws_security_group.openstack.id}"]

  attachment {
    instance     = aws_instance.controller[count.index].id
    device_index = 1
  }
}

# resource "aws_volume_attachment" "ebs" {
#   count = 2
#   device_name = "/dev/sdh"
#   volume_id   = var.ebs[count.index]
#   instance_id = aws_instance.controller[count.index].id
# }
