#################################
# VPC variable
#################################

vpc_cidr = "192.168.0.0/24"
vpc_name = "OT-Micro"
environment = "dev"
dns_support = true
dns_hostnames = true

#####################################
# public subnet CIDR
######################################

public_subnet_cidr = [ "192.168.0.0/28", "192.168.0.32/28" ]
availability_zones = [ "ap-south-1a", "ap-south-1b" ]
public_subnets_name = [ "public-subnet-1", "public-subnet-2" ]


#############################
# Frontend subnet
############################

frontend_cidr = "192.168.0.16/28"
frontend_subnet_name = "frontend"

#############################
# Application subnet
############################

application_subnet_cidr = "192.168.0.64/27"
application_subnet_name = "application"

#############################
# Database subnet
############################
database_cidr = "192.168.0.48/28"
database_subnet_name ="database"

#############################
# RT
############################
#--------------------------------
# Public Route Table
#--------------------------------
route_table_cidr_block = "0.0.0.0/0"
nat_domain = "vpc"

##################################
# alb sg
####################################

allow_port = 0
allow_all_protocol = -1
sg_cidr_range =  "0.0.0.0/0"

############################
# Load balancer
#############################
load_balancer_type = "application"
internal_value = false

########################
# route 53
########################

domain_name = "mysnaatak.com"
subdomain_name =  "employee-portal.mysnaatak.com"
record_type = "CNAME"
ttl_value = 300
