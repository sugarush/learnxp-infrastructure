terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//instance"
    source = "../../../../../terraform-modules/instance"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

distribution = "archlinux"
role = "build"
type = "t2.small"
iam_profile = "ec2-build"
security = [ "private", "world" ]
nodes = 1
