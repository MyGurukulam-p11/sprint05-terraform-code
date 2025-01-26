tcp_protocol = "tcp"
application_port = 8080
environment = "dev"
application_name = "attendance"
ami_id = "ami-04b4f1a9cf54c11d0"
instance_type = "t2.medium"
key_name = "otms"
launch_template_name = "attendance-launch-template"
http_protocol = "HTTP"
interval = "30"
health_check_path = "/api/v1/attendance/health"
timeout = "5"
healthy_threshold = "5"
unhealthy_threshold = "2"
tg_name = "attendance-tg"
http_listener_port = 80
enable_http_listener = false
asg_name = "attendance-asg"
desired_capacity = "1"
max_size = "1"
min_size = "1"
instance_name = "attendance-server"
policy_name = "attendance-policy"
policy_type = "TargetTrackingScaling"
metric_type = "ASGAverageCPUUtilization"
target_value = "75.0"
estimated_instance_warmup = "300"
adjustment_type = "ChangeInCapacity"

