tcp_protocol = "tcp"
application_port = 3000
environment = "dev"
application_name = "frontend"
ami_id = "ami-00bb6a80f01f03502"
instance_type = "t2.medium"
key_name = "otms"
http_protocol = "HTTP"
interval = "30"
health_check_path = "/"
timeout = "5"
healthy_threshold = "5"
unhealthy_threshold = "2"
http_listener_port = 80
enable_http_listener = true
asg_name = "frontend-asg"
desired_capacity = "1"
max_size = "1"
min_size = "1"
instance_name = "frontend-server"
estimated_instance_warmup = "300"
policy_name = "frontend-policy"
policy_type = "TargetTrackingScaling"
metric_type = "ASGAverageCPUUtilization"
target_value = "75.0"
adjustment_type = "ChangeInCapacity"
launch_template_name = "frontend-launch-template"
tg_name = "frontend-tg"
