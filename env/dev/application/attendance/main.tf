module "attendance_application" {
  source = "git::git@github.com:MyGurukulam-p11/sprint05-terraform-code.git//module/asg?ref=pritam_scrum_208"
  tcp_protocol = var.tcp_protocol
  application_port = var.application_port
  environment = var.environment
  application_name = var.application_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  launch_template_name = var.launch_template_name
  http_protocol = var.http_protocol
  interval = var.interval
  health_check_path = var.health_check_path
  timeout = var.timeout
  healthy_threshold = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  tg_name = var.tg_name 
  http_listener_port = var.http_listener_port
  enable_http_listener = var.enable_http_listener
  asg_name = var.asg_name
  desired_capacity = var.desired_capacity
  max_size = var.max_size
  min_size = var.min_size
  instance_name = var.instance_name
  policy_name = var.policy_name
  policy_type = var.policy_type
  metric_type = var.metric_type
  target_value = var.target_value
  estimated_instance_warmup = var.estimated_instance_warmup
  adjustment_type = var.adjustment_type 
}
