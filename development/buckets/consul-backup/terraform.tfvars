terragrunt = {
  terraform {
    source = "../../../../terraform-modules/bucket"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

name = "consul-backup"
