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
role = "web"
type = "t2.micro"
iam_profile = "ec2-general"
security = [ "private", "world", "cloudflare" ]
nodes = 1

public = true
#public_zone = "lrnxp.com"
