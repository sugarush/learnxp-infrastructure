terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//instance"
    source = "../../../../terraform-modules/instance"
  }

  include {
    path = "${find_in_parent_folders()}"
  }

  dependencies {
    paths = [ "../policy", "../security/group", "../security/rules" ]
  }
}

type = "t2.micro"
nodes = 1

public = true
