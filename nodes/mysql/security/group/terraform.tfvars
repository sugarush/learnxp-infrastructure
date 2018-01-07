terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//security"
    source = "../../../../../terraform-modules/security"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
