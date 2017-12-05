terragrunt = {

  terraform = {
    extra_arguments "common_var" {
      commands = [
        "apply",
        "destroy",
        "plan",
        "import",
        "push",
        "refresh"
      ]

      arguments = [
        "-var-file=${get_tfvars_dir()}/${path_relative_from_include()}/common.tfvars",
        "-var-file=${get_tfvars_dir()}/${find_in_parent_folders("common.tfvars")}",
      ]
    }
  }

  remote_state {
    backend = "s3"
    config {
      region = "us-west-2"
      dynamodb_table = "terraform-remote-state-alpha"
      bucket = "terraform-remote-state-alpha"
      key = "${path_relative_to_include()}/terraform.tfstate"
      encrypt = true
    }
  }
  
}
