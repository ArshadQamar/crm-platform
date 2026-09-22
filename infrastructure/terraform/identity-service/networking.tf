resource "aws_vpc" "identity_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true 
  enable_dns_hostnames = true 
  tags = {
    Name    = "${var.project_name}-${var.service_name}-vpc"
    service = "${var.service_name}"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.identity_vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.availability_zone_1
  tags = {
    Name    = "${var.project_name}-${var.service_name}-public-subnet-1"
    service = var.service_name
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.identity_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.availability_zone_2
  tags = {
    Name    = "${var.project_name}-${var.service_name}-public-subnet-2"
    service = var.service_name
  }
}

resource "aws_internet_gateway" "identity_igw" {
  vpc_id = aws_vpc.identity_vpc.id
  tags = {
    Name    = "${var.project_name}-${var.service_name}-igw"
    service = var.service_name
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.identity_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.identity_igw.id
  }
  tags = {
    Name    = "${var.project_name}-${var.service_name}-rt"
    service = var.service_name
  }
}

resource "aws_route_table_association" "public_subnet_1" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet_1.id
}
resource "aws_route_table_association" "public_subnet_2" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet_2.id
}