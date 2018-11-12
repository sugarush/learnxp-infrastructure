provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

data "aws_iam_policy_document" "this" {
  statement {

    actions = [
      "s3:ListBucket",
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::${var.identifier}-${var.environment}-archlinux-repository",
      "arn:aws:s3:::${var.identifier}-${var.environment}-archlinux-repository/*"
    ]

  }
}

resource "aws_iam_policy" "this" {
  name = "${var.identifier}-${var.environment}-${local.name}"
  policy = "${data.aws_iam_policy_document.this.json}"
}
