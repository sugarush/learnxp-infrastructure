terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//network"
    source = "../../../../terraform-modules/vpc"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

cidr = "172.16.0.0/16"

availability_zones = [ "a", "b", "c" ]

domain_name_servers = [ "127.0.0.1", "172.16.0.2" ]

public_subnets = [
  "172.16.0.0/19",
  "172.16.32.0/19",
  "172.16.64.0/19"
]

private_subnets = [
  "172.16.128.0/19",
  "172.16.160.0/19",
  "172.16.192.0/19"
]
