/*====
The VPC
======*/
data "aws_region" "current" {}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.environment}-vpc"
    Environment = var.environment
  }
}

/* Elastic IP for NAT */
resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.ig]
}

/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = element(aws_subnet.public_subnet.*.id, 0)
  depends_on = [
    aws_internet_gateway.ig]

  tags = {
    Name = "${var.environment}-nat"
    Environment = var.environment
  }
}

/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-igw"
    Environment = var.environment
  }
}

/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-public-route-table"
    Environment = var.environment
  }
}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-private-route-table"
    Environment = var.environment
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}

/* Public subnet */
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.public_subnets_cidr)
  cidr_block = element(var.public_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-${element(var.availability_zones, count.index)}-public-subnet"
    Environment = var.environment
  }
}

/* Private subnet */
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.private_subnets_cidr)
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment}-${element(var.availability_zones, count.index)}-private-subnet"
    Environment = var.environment
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ig.id
}

/* Route table associations */
resource "aws_route_table_association" "public" {
  count = length(var.public_subnets_cidr)
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets_cidr)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_vpc_endpoint" "vpc_gateway_endpoint" {
  count = var.create_gateway_endpoint ? length(var.endpoint_services) : 0

  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.${var.endpoint_services[count.index]}"
  route_table_ids = [aws_route_table.private.id]
}