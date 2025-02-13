##################################
# SG variable
##################################
variable "tcp_protocol" {
  type        = string
  default = "tcp"
}

variable "application_port" {
  type        = number
  description = "application port number"
  default = 8080
}

variable "environment" {
  description = "Environment name (e.g., dev, QA, prod)"
  type        = string
  default     = "dev"
}

variable "application_name" {
  type = string
  description = "application name"
  default = "frontend"
}

#####################################
# Launch template variable
##########################################

variable "ami_id" {
  type        = string
  description = "application ami id"
  default = "ami-04b4f1a9cf54c11d0"
}

variable "instance_type" {
  description = "The instance type for the launch template. Allowed values are t2.medium and t2.large."
  type        = string
  default = "t2.medium"

  validation {
    condition     = contains(["t2.micro", "t2.medium"], var.instance_type)
    error_message = "Invalid instance type. Allowed values are t2.medium or t2.large."
  }
}

variable "key_name" {
  type        = string
  default = "otms"
}


##########################################
# Target group variable
##########################################

variable "http_protocol" {
  type = string
  default = "HTTP"
}

variable "interval" {
  type = string
  default = "30"

}

variable "health_check_path" {
  type = string
  default = "/"
}

variable "timeout" {
  type = string
  default = "5"
}

variable "healthy_threshold" {
  type = string
  default = "5"
}

variable "unhealthy_threshold" {
  type = string
  default = "2"
}



###############################################
# default listener variable
###############################################


variable "http_listener_port" {
  type = number
  default = 80
}


variable "enable_http_listener" {
  description = "A boolean to enable or disable the HTTP listener."
  type        = bool
  default     = true
}

variable "https_protocol" {
  type = string
  default = "HTTPS"
  
}

###############################################
# Auto Scaling Group
########################################################

# asg variable




variable "desired_capacity" {
  type = string
  description = "salary asg desired_capacity"
  default = "2"
}

variable "max_size" {
  type = string
  description = "salary asg max size"
  default = "3"
}

variable "min_size" {
  type = string
  description = "salary asg min size"
  default = "2"
}



variable "is_frontend" {
  type = bool
  description = "is frontend"
  default = true
}


######################################
#  ASG policy variable
######################################

variable "policy_name" {
  type = string
  description = "asg policy name"
  default = "application autoscaling policy name"
}

variable "policy_type" {
  type = string
  description = "asg policy type"
  default = "TargetTrackingScaling"
}

variable "metric_type" {
  type = string
  description = "metric type"
  default = "ASGAverageCPUUtilization"
}

variable "target_value" {
  type = string
  description = "target value"
  default = "75.0"
}

variable "estimated_instance_warmup" {
  type = string
  default = "300"
}

variable "adjustment_type" {
  type = string
  default = "ChangeInCapacity"
}
