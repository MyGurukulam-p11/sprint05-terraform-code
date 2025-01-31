##################################################
# Vpc peering
##################################################

resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = data.aws_vpc.management-VPC.id     #requester
  peer_vpc_id   = aws_vpc.ot_micro_vpc.id   # accepter
  peer_region   = var.region        
  tags = {
    Name = local.vpc_peering_name
    Environment = var.environment
  }
}



resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  auto_accept               = var.auto_accept_peering
}

###################################
# cross entry of OT RT
######################################

resource "aws_route" "ot_public_rt" {
route_table_id = aws_route_table.public_rt.id
destination_cidr_block = var.management_vpc_cidr
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 
}


resource "aws_route" "ot_private_rt" {
route_table_id = aws_route_table.private_rt.id
destination_cidr_block = var.management_vpc_cidr
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 
}

#####################################
# cross entry of management RT
#####################################

resource "aws_route" "management_public_rt" {
route_table_id = data.aws_route_table.manage-public-RT.id
destination_cidr_block = var.vpc_cidr
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 
}


resource "aws_route" "management_private_rt" {
route_table_id = data.aws_route_table.manage-Private-RT.id
destination_cidr_block = var.vpc_cidr
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 

}


######################################
#       VPC 
######################################

resource "aws_vpc" "ot_micro_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.dns_hostnames

  tags = {
    Name        = local.vpc_full_name
    Environment = var.environment
  }
}


#########################################
# Public subnets
##########################################

resource "aws_subnet" "public_subnets" {
  count             = 2
  vpc_id            = aws_vpc.ot_micro_vpc.id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = local.public_subnet_full_name[count.index]
    Environment = var.environment
  }
}


###########################################
# Frontend Subnet
############################################
resource "aws_subnet" "frontend_subnet" {
  vpc_id            = aws_vpc.ot_micro_vpc.id
  cidr_block        = var.frontend_cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = local.frontend_subnet_full_name
    Environment = var.environment
    
  }
}


######################################
# Application Subnet
######################################
resource "aws_subnet" "application_subnet" {
  vpc_id            = aws_vpc.ot_micro_vpc.id
  cidr_block        = var.application_subnet_cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = local.application_subnet_full_name
    Environment = var.environment
  }
}

####################################
# database Subnet 
########################################
resource "aws_subnet" "database_subnet" {
  vpc_id            = aws_vpc.ot_micro_vpc.id
  cidr_block        = var.database_cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = local.database_subnet_full_name
    Environment = var.environment
  }
}


###############################
# Internet Gateway
###############################

resource "aws_internet_gateway" "ot_igw" {
  vpc_id = aws_vpc.ot_micro_vpc.id
  
  tags = {
    Name = local.igw_full_name
    Environment = var.environment
  }
}


######################################
# EIP and Nat Gateway
######################################

#------------------------------------
# Elastic IP for NAT Gateway
#------------------------------------
resource "aws_eip" "nat_eip" {
  domain = var.nat_domain
  
  tags = {
    Name = local.eip_name
    Environment = var.environment
  }
}

#############################################
# NAT Gateway
#############################################

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = local.nat_name
    Environment = var.environment
  }
}


######################################
# Public Route Table
###########################################

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ot_micro_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.ot_igw.id
  }

  tags = {
    Name = local.public_route_table_name
    Environment = var.environment
  }
}

###########################################
# Private Route Table
############################################
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.ot_micro_vpc.id

  route {
    cidr_block     = var.route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = local.Private_route_table_name
    Environment = var.environment
  }
}


############################################
# Route Table Association for Subnets
#############################################

resource "aws_route_table_association" "public_rt_association" {
  count          = length(aws_subnet.public_subnets) 
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table Association for Application, Database, and Frontend Subnets
resource "aws_route_table_association" "private_rt_association" {
  count = length(
    concat(
    [aws_subnet.application_subnet.id], 
      [aws_subnet.frontend_subnet.id], 
      [aws_subnet.database_subnet.id]
    )
  )

  subnet_id = element(
    concat(
      [aws_subnet.application_subnet.id], 
      [aws_subnet.frontend_subnet.id], 
      [aws_subnet.database_subnet.id]
    ), 
    count.index
  )

  route_table_id = aws_route_table.private_rt.id
}


#########################################
# Security group for the load balancer
#########################################

resource "aws_security_group" "dev_alb_sg" {
  vpc_id = aws_vpc.ot_micro_vpc.id

  ingress {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.allow_all_protocol
    cidr_blocks = [var.sg_cidr_range] 
  }

  egress {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.allow_all_protocol 
    cidr_blocks = [var.sg_cidr_range]
  }

  tags = {
    Name = local.lb_sg_name
    Environment = var.environment
  }
}


##############################
# Load balancer 
##############################

resource "aws_lb" "dev_alb" {
  name = local.alb_name
  internal           = var.internal_value
  load_balancer_type = var.load_balancer_type 
  security_groups    = [aws_security_group.dev_alb_sg.id]
  subnets          = aws_subnet.public_subnets[*].id


  tags = {
    Name = local.alb_name
    Environment = var.environment
  }
}


###############################################
# route 53
###############################################

resource "aws_route53_zone" "dev_route53" {
  name = var.domain_name  
  vpc {
    vpc_id = aws_vpc.ot_micro_vpc.id
  }      
}

################################################
# route53 records
################################################

resource "aws_route53_record" "cname_record" {
  zone_id = aws_route53_zone.dev_route53.zone_id
  name    = var.subdomain_name
  type    = var.record_type
  ttl     = var.ttl_value
  records = [aws_lb.dev_alb.dns_name]
}

