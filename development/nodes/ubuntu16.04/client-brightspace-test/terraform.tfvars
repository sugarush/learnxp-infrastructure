terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//instance"
    source = "../../../../../terraform-modules/autoscaling"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

distribution = "ubuntu16.04"
role = "client-brightspace-test"
type = "t2.micro"
iam_profile = "ec2-general"
security = [ "private", "world" ]
min = 1
max = 5
metric = "ASGAverageCPUUtilization"
metric_value = 50.0
