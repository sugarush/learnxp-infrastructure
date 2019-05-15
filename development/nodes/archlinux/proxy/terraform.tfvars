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
role = "proxy"
type = "t2.micro"
iam_profile = "ec2-general"
security = [ "private", "world", "openvpn", "world-ssh-in" ]
nodes = 1

public = true
#public_zone = "lrnxp.com"
