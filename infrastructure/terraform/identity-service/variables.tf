variable "aws_region" {
  description = "AWS region where the infrastructure will be created"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the Identity Service VPC"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
}

variable "availability_zone_2" {
  description = "Second availability zone"
  type        = string
}

variable "db_password" {
  description = "Master password for the Identity Service PostgreSQL database"
  type        = string
  sensitive   = true
}