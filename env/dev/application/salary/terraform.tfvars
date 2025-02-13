tcp_protocol = "tcp"
application_port = 8080
environment = "dev"
application_name = "salary"
ami_id = "ami-078ac91456d3d1aa0"
instance_type = "t2.medium"
is_frontend = false
key_name = "OTMS-key"
http_protocol = "HTTP"
interval = "30"
health_check_path = "/actuator/prometheus"
timeout = "5"
healthy_threshold = "5"
unhealthy_threshold = "2"
http_listener_port = 80
enable_http_listener = false
https_protocol = "HTTPS"
desired_capacity = "1"
max_size = "1"
min_size = "1"
policy_name = "salary-policy"
policy_type = "TargetTrackingScaling"
metric_type = "ASGAverageCPUUtilization"
target_value = "75.0"
estimated_instance_warmup = "300"
adjustment_type = "ChangeInCapacity"
