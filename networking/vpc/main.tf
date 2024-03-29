/*====
The VPC
======*/
data "aws_region" "current" {}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    {
      Name = "${var.environment}-vpc"
    },
    var.tags
  )
}

/* Elastic IP for NAT */
resource "aws_eip" "nat_eip" {
  count = var.create_nat_gateway && var.nat_gateway_type == "NAT_GATEWAY" ? 1 : 0

  vpc        = true
  depends_on = [
    aws_internet_gateway.ig
  ]

  tags = var.tags
}

/* NAT */
resource "aws_nat_gateway" "nat" {
  count = var.create_nat_gateway && var.nat_gateway_type == "NAT_GATEWAY" ? 1 : 0

  allocation_id = aws_eip.nat_eip.*.id[0]

  subnet_id = element(aws_subnet.public_subnet.*.id, 0)

  depends_on = [
    aws_internet_gateway.ig
  ]

  tags = merge(
    {
      Name = "${var.environment}-nat"
    },
    var.tags
  )
}

/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      Name = "${var.environment}-igw"
    },
    var.tags
  )

}

/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      Name = "${var.environment}-public-route-table"
    },
    var.tags
  )
}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    {
      Name = "${var.environment}-private-route-table"
    },
    var.tags
  )
}

resource "aws_route" "private_nat_gateway" {
  count = var.create_nat_gateway && var.nat_gateway_type == "NAT_GATEWAY" ? 1 : 0

  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.*.id[0]
}

resource "aws_route" "private_nat_instance" {
  count = var.create_nat_gateway && var.nat_gateway_type == "NAT_INSTANCE" ? 1 : 0

  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = var.nat_instance_id
}

/* Public subnet */
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidr)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.public_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name = "${var.environment}-${element(var.availability_zones, count.index)}-public-subnet"
    },
    var.tags
  )
}

/* Private subnet */
resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets_cidr)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.private_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    {
      Name = "${var.environment}-${element(var.availability_zones, count.index)}-private-subnet"
    },
    var.tags
  )
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

/* Route table associations */
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_vpc_endpoint" "vpc_gateway_endpoint" {
  count = var.create_gateway_endpoint ? length(var.endpoint_services) : 0

  vpc_id          = aws_vpc.vpc.id
  service_name    = "com.amazonaws.${data.aws_region.current.name}.${var.endpoint_services[count.index]}"
  route_table_ids = [aws_route_table.private.id]

  tags = merge(
    {
      Name = "${var.environment}-vpc-endpoint"
    },
    var.tags
  )
}