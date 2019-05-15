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
role = "admin"
type = "t2.micro"
iam_profile = "ec2-admin"
security = [ "private", "world" ]
nodes = 1
