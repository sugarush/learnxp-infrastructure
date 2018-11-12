provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

data "aws_iam_policy" "this" {
  count = "${length(local.policies)}"

  arn = "arn:aws:iam::${var.account}:policy/${var.identifier}-${var.environment}-${element(local.policies, count.index)}"
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals = {
      type = "Service"
      identifiers = [ "ec2.amazonaws.com" ]
    }
  }
}

resource "aws_iam_role" "this" {
  name = "${var.identifier}-${var.environment}-${local.name}"
  assume_role_policy = "${data.aws_iam_policy_document.this.json}"
}

resource "aws_iam_role_policy_attachment" "this" {
  count = "${length(local.policies)}"

  role = "${aws_iam_role.this.name}"
  policy_arn = "${element(data.aws_iam_policy.this.*.arn, count.index)}"
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.identifier}-${var.environment}-${local.name}"
  role = "${aws_iam_role.this.name}"
}
