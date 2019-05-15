provider "aws" {
  version = "~> 1.5"
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

locals {
  name = "openvpn"
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

resource "aws_security_group_rule" "openvpn" {
  type = "ingress"
  protocol = -1
  from_port = 1194
  to_port = 1194
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "ssh-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "imap-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 143
  to_port = 143
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "imaps-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 993
  to_port = 993
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "pop-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 110
  to_port = 110
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "pops-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 995
  to_port = 995
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "smtp-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 25
  to_port = 25
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "smtps-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 465
  to_port = 465
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}
