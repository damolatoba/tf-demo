## VPC
resource "aws_vpc" "vnet" {
    cidr_block = var.vnet_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = merge(
      local.tags,
      {
        Name = "Demo VNet"
      },
    )
}

## Public Subnet
resource "aws_subnet" "zone_a" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "${cidrsubnet(aws_vpc.vnet.cidr_block, 8, 0)}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = merge(
    local.tags,
    {
      Name = "Demo Subnet AZ A"
    },
  )
}

## Private Subnet
resource "aws_subnet" "zone_b" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "${cidrsubnet(aws_vpc.vnet.cidr_block, 8, 1)}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = merge(
    local.tags,
    {
      Name = "Demo Subnet AZ B"
    },
  )
}

resource "aws_subnet" "zone_c" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "${cidrsubnet(aws_vpc.vnet.cidr_block, 8, 2)}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"
  tags = merge(
    local.tags,
    {
      Name = "Demo Subnet AZ C"
    },
  )
}

resource "aws_subnet" "zone_d" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "${cidrsubnet(aws_vpc.vnet.cidr_block, 8, 3)}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1d"
  tags = merge(
    local.tags,
    {
      Name = "Demo Subnet AZ D"
    },
  )
}

resource "aws_subnet" "zone_e" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "${cidrsubnet(aws_vpc.vnet.cidr_block, 8, 4)}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1e"
  tags = merge(
    local.tags,
    {
      Name = "Demo Subnet AZ E"
    },
  )
}