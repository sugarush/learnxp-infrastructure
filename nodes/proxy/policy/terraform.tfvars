terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//policy"
    source = "../../../../terraform-modules/policy"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
