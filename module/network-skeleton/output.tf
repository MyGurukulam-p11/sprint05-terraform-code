# vpc id

output "vpc_id" {
  value = aws_vpc.ot_micro_vpc.id
}

# public subnet id

output "public_subnets_id" {
  value = aws_subnet.public_subnets[*].id
}

# frontend subnet id

output "frontend_subnet_id" {
  value = aws_subnet.frontend_subnet.id
}

# application subnet id

output "application_subnet_id" {
  value = aws_subnet.application_subnet.id
}

# DB subnet id

output "database_subnet_id" {
  value = aws_subnet.database_subnet.id
}

# IGW id

output "internet_gateway_id" {
  value = aws_internet_gateway.ot_igw.id
}

# public rt 
output "public_route_table_id" {
  value = aws_route_table.public_rt.id
}


# Nat id

output "nat_gw_id" {
  value = aws_nat_gateway.nat_gw.id
}


# Lb sg id

output "load_balancer_sg_id" {
  value = aws_security_group.dev_alb_sg.id
}




# alb arn and name

output "alb_arn" {
  value = aws_lb.dev_alb.arn
}


output "alb_dns_name" {
  value = aws_lb.dev_alb.dns_name
  description = "The DNS name of the Application Load Balancer"
}