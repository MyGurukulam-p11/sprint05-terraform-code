#################################
# VPC variable
#################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/24"
}

variable "vpc_name" {
  description = "Base name for the VPC"
  type        = string
  default     = "OT-Micro"
}

variable "environment" {
  description = "Environment name (e.g., dev, QA, prod)"
  type        = string
  default     = "dev"
}

variable "dns_support" {
  type = bool
  default = true

}

variable "dns_hostnames" {
  type = bool
  default = true
}

#####################################
# public subnet CIDR
######################################

variable "public_subnet_cidr" {
  description = " cidr of public subnet"
  type = list(string)
  default = ["192.168.0.0/28", "192.168.0.32/28"] 
}

variable "availability_zones" {
  description = "AZ for both subnets"
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_name" {
  description = "name of public subnet"
  type = list(string)
  default = [ "public-subnet-1", "public-subnet-2" ]
}


#############################
# Frontend subnet
############################

variable "frontend_cidr" {
  description = " cidr of frontend subnet"
  type = string
  default =  "192.168.0.16/28"
}

variable "frontend_subnet_name" {
  description = "frontend-subnet-name"
  type = string
  default = "frontend"
}

#############################
# Application subnet
############################

variable "application_subnet_cidr" {
  description = " cidr for application subnet"
  type = string
  default = "192.168.0.64/27"
}

variable "application_subnet_name" {
  description = "application-subnet-name"
  type = string
  default = "application"
}

#############################
# Database subnet
############################

variable "database_cidr" {
  description = " cidr of DB subnet"
  type = string
  default = "192.168.0.48/28"
}

variable "database_subnet_name" {
  description = "database-subnet-name"
  type = string
  default = "database"
}

#############################
# RT
############################
#--------------------------------
# Public Route Table
#--------------------------------

variable "route_table_cidr_block" {
  description = "cidr for route table"
  type = string
  default = "0.0.0.0/0"
}

variable "nat_domain" {
  type = string
  default = "vpc"
}



##################################
# alb sg
####################################

variable "allow_port" {
  type = number
  default = "0"
}

variable "allow_all_protocol" {
   type = number
  default = "-1"
}

variable "sg_cidr_range" {
  type = string
  default = "0.0.0.0/0"
}

##############################
# TG
##############################

variable "protocol_type" {
  type = string
  default = "HTTP"
}

variable "interval" {
  type = string
  default = "30"
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

variable "path" {
  type = string
  default = "/"
}

variable "application_name" {
  type = string
  default = "frontend"
}

variable "application_port" {
  type = number
  default = 3000
}


############################
# Load balancer
#############################

variable "load_balancer_type" {
  description = "load balancer type name"
  type = string
  default = "application"
}

variable "internal_value" {
  type = bool
  default = false
}


########################
# route 53
########################

variable "domain_name" {
  description = "name of domain name"
  type = string
  default = "mysnaatak.com"
}

variable "subdomain_name" {
  type = string
  default = "employee-portal.mysnaatak.com"
}

variable "record_type" {
  description = "The type of the DNS record"
  type        = string
  default     = "CNAME"
}

variable "ttl_value" {
  description = "ttl value"
  type = number
  default = 300
}