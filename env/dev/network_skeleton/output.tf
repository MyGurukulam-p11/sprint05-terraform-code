# vpc id

output "vpc_id" {
  value = module.network_skeleton.vpc_id
  description = "vpc id"
}

# public subnet id

output "public_subnets_id" {
  value = module.network_skeleton.public_subnets_id[*]
  description = "value of public subnet id"

}

# frontend subnet id

output "frontend_subnet_id" {
  value = module.network_skeleton.frontend_subnet_id
    description = "frontend subnet id"
}

# application subnet id

output "application_subnet_id" {
  value = module.network_skeleton.application_subnet_id
    description = "application subnet id"
}

# DB subnet id

output "database_subnet_id" {
  value = module.network_skeleton.database_subnet_id
    description = "database subnet id"
}

# IGW id

output "internet_gateway_id" {
  value = module.network_skeleton.internet_gateway_id
    description = "internet gateway id"
}

# public rt 
output "public_route_table_id" {
  value = module.network_skeleton.public_route_table_id
    description = "public route table id"
}


# Nat id

output "nat_gw_id" {
  value = module.network_skeleton.nat_gw_id
    description = "nat gateway id"
}


# Lb sg id

output "load_balancer_sg_id" {
  value = module.network_skeleton.load_balancer_sg_id
    description = "load balancer security group id"
}


# alb arn and name

output "alb_arn" {
  value = module.network_skeleton.alb_arn
    description = "The ARN of the Application Load Balancer"
}


output "alb_dns_name" {
  value = module.network_skeleton.alb_dns_name
  description = "The DNS name of the Application Load Balancer"

}

# Route 53 

output "route53_zone_id" {
  value = module.network_skeleton.route53_zone_id
}

