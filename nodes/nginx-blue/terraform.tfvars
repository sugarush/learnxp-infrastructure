terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//instance"
    source = "../../../terraform-modules/instance"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

role = "nginx-blue"
type = "t2.micro"
iam_profile = "ec2-general"
security = [ "private", "world", "world-http" ]
nodes = 1

#public = true
#public_zone = "lrnxp.com"
