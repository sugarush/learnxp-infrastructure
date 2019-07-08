locals {
  name = "ec2-general"

  policies = [
    "ec2-create-tags",
    "ec2-describe-tags",
    "s3-read-archlinux-repository"
  ]
}
