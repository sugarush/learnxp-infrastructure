provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

data "aws_iam_policy_document" "this" {
  statement {

    actions = [
      "ec2:DescribeInstances"
    ]

    resources = [
      "*"
    ]

  }
}

resource "aws_iam_policy" "this" {
  name = "${var.identifier}-${var.environment}-${local.name}"
  policy = "${data.aws_iam_policy_document.this.json}"
}
