locals {
  name = "ec2-build"

  policies = [
    "ec2-create-tags",
    "ec2-describe-tags",
    "s3-read-archlinux-repository",
    "s3-write-archlinux-repository"
  ]
}
