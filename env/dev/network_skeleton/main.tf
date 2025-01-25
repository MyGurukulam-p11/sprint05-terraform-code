module "network_skeleton" {
    source = "./module"
    vpc_cidr = var.vpc_cidr
    dns_support = var.dns_support
    dns_hostnames = var.dns_hostnames
    environment = var.environment
    public_subnet_cidr = var.public_subnet_cidr
    availability_zones = var.availability_zones
    public_subnets_name = var.public_subnets_name
    frontend_cidr = var.frontend_cidr
    frontend_subnet_name = var.frontend_subnet_name
    application_subnet_cidr = var.application_subnet_cidr
    application_subnet_name = var.application_subnet_name
    database_cidr = var.database_cidr
    database_subnet_name = var.database_subnet_name
    route_table_cidr_block = var.route_table_cidr_block
    nat_domain = var.nat_domain
    allow_port = var.allow_port
    allow_all_protocol = var.allow_all_protocol
    sg_cidr_range = var.sg_cidr_range
    load_balancer_type = var.load_balancer_type
    internal_value = var.internal_value
    domain_name = var.domain_name
    subdomain_name = var.subdomain_name
    record_type = var.record_type
    ttl_value = var.ttl_value
}