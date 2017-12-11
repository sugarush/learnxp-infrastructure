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

nodes = 3
type = "t2.micro"
