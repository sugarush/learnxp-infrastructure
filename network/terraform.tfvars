terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//network"
    source = "../../terraform-modules/network"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

cidr = "172.16.0.0/22"

availability_zones = [ "a", "b", "c" ]

domain_name_servers = [ "127.0.0.1", "172.16.0.2" ]

public_subnets = [ "172.16.0.0/26", "172.16.0.64/26", "172.16.0.128/26" ]
private_subnets = [ "172.16.1.0/26", "172.16.1.64/26", "172.16.1.128/26" ]
