## VPC
resource "aws_vpc" "vnet" {
    cidr_block = var.vnet_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = local.tags
}

## Public Subnet
resource "aws_subnet" "zone_a" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "${cidrsubnet(aws_vpc.vnet.cidr_block, 3, 1)}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = local.tags
}

## Private Subnet
# resource "aws_subnet" "zone_b" {
#   vpc_id = aws_vpc.vnet.id
#   cidr_block = var.privatesubnet_cidr
#   map_public_ip_on_launch = true
#   availability_zone = "us-east-1b"
#   tags = local.tags
# }




