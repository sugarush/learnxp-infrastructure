terragrunt = {
  terraform {
    source = "git@github.com:sugarush/terraform-modules.git//base"
    source = "../../../../../terraform-modules/base"
  }

  include {
    path = "${find_in_parent_folders()}"
  }

  dependencies {
    paths = [ "../group" ]
  }
}
