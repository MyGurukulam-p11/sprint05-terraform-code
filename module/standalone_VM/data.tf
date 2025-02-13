data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "ap-south-1"
  }
}


data "terraform_remote_state" "attendance_state" {
  backend = "s3"

  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/application/attendance/terraform.tfstate"
    region = "ap-south-1"
  }
}


data "terraform_remote_state" "salary_state" {
  backend = "s3"

  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/application/salary/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "employee_state" {
  backend = "s3"

  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/application/employee/terraform.tfstate"
    region = "ap-south-1"
  }
}


data "terraform_remote_state" "asg_state" {
  backend = "s3"

  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/application/frontend/terraform.tfstate"
    region = "ap-south-1"
  }
}


data "aws_security_group" "jenkins_sg_id" {
  filter {
    name   = "tag:Name"         
    values = ["Jekins-sg"]         
  }
}
