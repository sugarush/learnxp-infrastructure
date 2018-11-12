provider "aws" {
  version = "~> 1.5"
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

variable "name" {
  default = "world"
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

resource "aws_security_group_rule" "ssh-required-out" {
  # Allow SSH to Github
  type = "egress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = [
    # Allow SSH to Github
    "192.30.252.0/22"
  ]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "dns-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 53
  to_port = 53
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "http-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "ntp-world-out" {
  type = "egress"
  protocol = "udp"
  from_port = 123
  to_port = 123
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}

resource "aws_security_group_rule" "https-world-out" {
  type = "egress"
  protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.this.id}"
}
