data "terraform_remote_state" "postgresSQL_state" {
  backend = "s3"
  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/application/attendance/terraform.tfstate"
    region = "ap-south-1"
  }
}
data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"
  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "ap-south-1"
  }
}
module "postgresSQL" {
  source = "git::git@github.com:MyGurukulam-p11/sprint05-terraform-code.git//module/standalone_VM?ref=mohit_scrum_209"
  listener_rule_priority = var.listener_rule_priority
  path_patterns = var.path_patterns
  target_group_arn = data.terraform_remote_state.postgresSQL_state.outputs.attendance_target_group_arn
  ssh_port = var.ssh_port
  tcp_protocol = var.tcp_protocol
  postgresSQL_port = var.postgresSQL_port
  scylla_port = var.scylla_port
  enable_attendance_access = var.enable_attendance_access
  enable_employee_access = var.enable_employee_access
  enable_salary_access = var.enable_salary_access     
  environment = var.environment
  database_name = var.database_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  private_key_name = var.private_key_name
  device_name = var.device_name
  ebs_volume_size = var.ebs_volume_size
  ebs_volume_type = var.ebs_volume_type
  delete_on_termination = var.delete_on_termination
  enable_attendance_access_for_redis = var.enable_attendance_access_for_redis
  enable_employee_access_for_redis = var.enable_employee_access_for_redis
  enable_salary_access_for_redis = var.enable_salary_access_for_redis
  redis_port = var.redis_port
  subdomain_name = var.subdomain_name
  record_type = var.record_type
  ttl_value = var.ttl_value
}
