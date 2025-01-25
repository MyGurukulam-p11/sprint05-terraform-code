# vpc id

output "vpc_id" {
  value = module.network_skeleton.vpc_id
}

# public subnet id

output "public_subnets_id" {
  value = module.network_skeleton.public_subnets_id[*]
}

# frontend subnet id

output "frontend_subnet_id" {
  value = module.network_skeleton.frontend_subnet_id
}

# application subnet id

output "application_subnet_id" {
  value = module.network_skeleton.application_subnet_id
}

# DB subnet id

output "database_subnet_id" {
  value = module.network_skeleton.database_subnet_id
}

# IGW id

output "internet_gateway_id" {
  value = module.network_skeleton.internet_gateway_id
}

# public rt 
output "public_route_table_id" {
  value = module.network_skeleton.public_route_table_id
}


# Nat id

output "nat_gw_id" {
  value = module.network_skeleton.nat_gw_id
}


# Lb sg id

output "load_balancer_sg_id" {
  value = module.network_skeleton.load_balancer_sg_id
}


# alb arn and name

output "alb_arn" {
  value = module.network_skeleton.alb_arn
}


output "alb_dns_name" {
  value = module.network_skeleton.alb_dns_name
  description = "The DNS name of the Application Load Balancer"
}