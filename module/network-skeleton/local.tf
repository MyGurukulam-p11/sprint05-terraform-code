# Vpc peering

locals {
  vpc_peering_name = "${var.environment}-peering"
}


# VPC
locals {
  vpc_full_name = "${var.vpc_name}-${var.environment}-vpc"
}

# public subnet

locals {
  public_subnet_full_name = [for idx, name in var.public_subnets_name : "otms-${var.environment}-${name}"]
}

# frontend subnet

locals {
  frontend_subnet_full_name = "otms-${var.environment}-${var.frontend_subnet_name}-subnet"
}

# application subnet

locals {
  application_subnet_full_name = "otms-${var.environment}-${var.application_subnet_name}-subnet"
}

# DB subnet
locals {
  database_subnet_full_name = "otms-${var.environment}-${var.database_subnet_name}-subnet"
}

# Internet gateway

locals {
  igw_full_name = "otms-${var.environment}-igw"
}

# Public RT

locals {
  public_route_table_name = "otms-${var.environment}-public-rt"
}

# Private RT

locals {
  Private_route_table_name = "otms-${var.environment}-private-rt"
}

# eip 

locals {
  eip_name = "otms-${var.environment}-eip"
}

# nat

locals {
  nat_name = "otms-${var.environment}-nat-gateway"
}

# lb sg
locals {
  lb_sg_name = "otms-${var.environment}-lb-sg"
}


# ALB

locals {
  alb_name = "otms-${var.environment}-alb"
}