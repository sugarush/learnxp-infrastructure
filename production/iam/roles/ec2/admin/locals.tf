locals {
  name = "ec2-admin"

  policies = [
    "ec2-create-tags",
    "ec2-describe-tags",
    "ec2-describe-instances",
    "s3-read-archlinux-repository",
    "s3-read-consul-backup",
    "s3-write-consul-backup"
  ]
}
