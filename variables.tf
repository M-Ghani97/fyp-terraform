variable "region" {
  default = "us-east-1"
}

variable "ubuntu_ami" {
    default = "ami-0ac80df6eff0e70b5"
}

variable "node_name" {
  type = list
  default = ["controller", "compute"]
}

variable "ebs" {
  type = list
  default = ["vol-0aad0e4775094e7c8", "vol-0f316f882733a745d"]
}