##################################
# Vpc peering variable
##################################

variable "region" {
  description = "value of region"
  type = string
  default = "ap-south-1"
}

variable "auto_accept_peering" {
  description = "value of auto accept peering"
  type = bool
  default = true  
}


variable "management_vpc_cidr" {
  description = "value of management vpc id"
  type = string
  default = "10.0.1.0/26"
  
}

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
  description = "value of dns support"

}

variable "dns_hostnames" {
  type = bool
  default = true
  description = "value of dns hostnames"
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
  description = "value of nat domain"
}



##################################
# alb sg
####################################

variable "allow_port" {
  type = number
  default = "0"
  description = "value of allow port"
}

variable "allow_all_protocol" {
   type = number
  default = "-1"
  description = "value of allow all protocol"
}

variable "sg_cidr_range" {
  type = string
  default = "0.0.0.0/0"
  description = "value of sg cidr range"
}

##############################
# TG
##############################

variable "protocol_type" {
  type = string
  default = "HTTP"
  description = "protocol type"
}

variable "interval" {
  type = string
  default = "30"
  description = "value of interval"
}

variable "timeout" {
  type = string
  default = "5"
  description = "value of timeout"
}

variable "healthy_threshold" {
  type = string
  default = "5"
  description = "value of healthy threshold"
}

variable "unhealthy_threshold" {
  type = string
  default = "2"
  description = "value of unhealthy threshold"
}

variable "path" {
  type = string
  default = "/"
  description = "value of path"
}

variable "application_name" {
  type = string
  default = "frontend"
  description = "value of application name"
}

variable "application_port" {
  type = number
  default = 3000
  description = "value of application port"
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
  description = "value of internal"
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
  description = "value of subdomain name"
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