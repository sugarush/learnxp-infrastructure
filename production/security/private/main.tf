provider "aws" {
  version = "~> 1.5"
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

locals {
  name = "private"
}

data "aws_vpc" "selected" {
  tags {
    Name = "${var.identifier}-${var.environment}"
  }
}

resource "aws_security_group" "this" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    Name = "${var.identifier}-${var.environment}-${local.name}"
  }
}

resource "aws_security_group_rule" "private-in" {
  type = "ingress"
  protocol = -1
  from_port = 0
  to_port = 0
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "private-out" {
  type = "egress"
  protocol = -1
  from_port = 0
  to_port = 0
  cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]

  security_group_id = "${aws_security_group.this.id}"
}
