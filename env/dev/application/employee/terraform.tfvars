tcp_protocol = "tcp"
application_port = 8080
environment = "dev"
application_name = "employee"
ami_id = "ami-0cf502a52155cef85"
instance_type = "t2.micro"
is_frontend = false
key_name = "OTMS-key"
launch_template_name = "employee-launch-template"
http_protocol = "HTTP"
interval = "30"
health_check_path = "/api/v1/employee/health"
timeout = "5"
healthy_threshold = "5"
unhealthy_threshold = "2"
tg_name = "employee-tg"
http_listener_port = 80
enable_http_listener = false
asg_name = "employee-asg"
desired_capacity = "1"
max_size = "1"
min_size = "1"
instance_name = "employee-server"
policy_name = "employee-policy"
policy_type = "TargetTrackingScaling"
metric_type = "ASGAverageCPUUtilization"
target_value = "75.0"
estimated_instance_warmup = "300"
adjustment_type = "ChangeInCapacity"
