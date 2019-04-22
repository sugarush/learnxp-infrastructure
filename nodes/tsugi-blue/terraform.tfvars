terragrunt = {
  terraform {
    #source = "git@github.com:sugarush/terraform-modules.git//instance"
    source = "../../../terraform-modules/autoscaling"
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}

role = "tsugi-blue"
type = "t2.micro"
iam_profile = "ec2-general"
security = [ "private", "world" ]
min = 1
max = 1
adjustment = 1
metric = "ASGAverageCPUUtilization"
metric_value = 50.0
