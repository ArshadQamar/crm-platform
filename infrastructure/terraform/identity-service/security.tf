resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-${var.service_name}-rds-sg"
  description = "Security group for Identity Service PostgreSQL RDS"
  vpc_id      = aws_vpc.identity_vpc.id

  ingress {
    description = "From Development machine to postgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["124.29.242.26/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-${var.service_name}-rds-sg"
    service = var.service_name
  }
}