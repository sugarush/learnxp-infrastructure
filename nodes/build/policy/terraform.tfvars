terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//policy"
    source = "../../../../terraform-modules/policy"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

actions = [
  "s3:PutObject"
]

resources = [
  "arn:aws:s3:::*-archlinux-repository",
  "arn:aws:s3:::*-archlinux-repository/*"
]
