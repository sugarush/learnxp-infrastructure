provider "aws" {
  version = "~> 1.5"
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

variable "name" {
  default = "world-openvpn"
}

data "aws_vpc" "selected" {
  tags {
    Name = "${var.identifier}-${var.environment}"
  }
}

resource "aws_security_group" "this" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    Name = "${var.identifier}-${var.environment}-${var.name}"
  }
}

resource "aws_security_group_rule" "openvpn" {
  type = "ingress"
  protocol = -1
  from_port = 1194
  to_port = 1194
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}
