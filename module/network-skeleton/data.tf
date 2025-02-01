
# management-VPC

data "aws_vpc" "management-VPC" {
  filter {
    name   = "tag:Name"         
    values = ["managenment-VPC"]         
  }
}

# management-RT

data "aws_route_table" "manage-public-RT" {
  filter {
    name   = "tag:Name"         
    values = ["management-Public-RT"]         
  }
}

data "aws_route_table" "manage-Private-RT" {
  filter {
    name   = "tag:Name"         
    values = ["management-Private-RT"]         
  }
}


data "aws_route53_zone" "public-zone" {
  name = "teckwithpratham.click"
}
