terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//bucket"
    source = "../../../../terraform-modules/bucket"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

name = "archlinux-repository"
