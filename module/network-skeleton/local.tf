# VPC
locals {
  vpc_full_name = "${var.vpc_name}-${var.environment}-vpc"
}

# public subnet

locals {
  public_subnet_full_name = [for idx, name in var.public_subnets_name : "${var.environment}-${name}"]
}

# frontend subnet

locals {
  frontend_subnet_full_name = "${var.environment}-${var.frontend_subnet_name}-subnet"
}

# application subnet

locals {
  application_subnet_full_name = "${var.environment}-${var.application_subnet_name}-subnet"
}

# DB subnet
locals {
  database_subnet_full_name = "${var.environment}-${var.database_subnet_name}-subnet"
}

# Internet gateway

locals {
  igw_full_name = "${var.environment}-igw"
}

# Public RT

locals {
  public_route_table_name = "${var.environment}-public-rt"
}

# Private RT

locals {
  Private_route_table_name = "${var.environment}-Private-rt"
}

# eip 

locals {
  eip_name = "${var.environment}-eip"
}

# nat

locals {
  nat_name = "${var.environment}-nat-gateway"
}

# lb sg
locals {
  lb_sg_name = "${var.environment}-lb-sg"
}

# TG 

locals {
  tg_name = "${var.environment}-${var.application_name}-tg"
}


# ALB

locals {
  alb_name = "${var.environment}-alb"
}


