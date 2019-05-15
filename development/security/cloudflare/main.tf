provider "aws" {
  version = "~> 1.5"
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

locals {
  name = "cloudflare"
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

resource "aws_security_group_rule" "cloudflare" {
  type = "ingress"

  protocol = -1

  from_port = 0
  to_port = 0

  cidr_blocks = [
    "173.245.48.0/20",
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "141.101.64.0/18",
    "108.162.192.0/18",
    "190.93.240.0/20",
    "188.114.96.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "162.158.0.0/15",
    "104.16.0.0/12",
    "172.64.0.0/13",
    "131.0.72.0/22"
  ]

  security_group_id = "${aws_security_group.this.id}"
}
