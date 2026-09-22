resource "aws_db_subnet_group" "Identity_db_subnet_group" {
  name = "${var.project_name}-${var.service_name}-db-subnet-group"
  subnet_ids = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
  tags = {
    Name    = "${var.project_name}-${var.service_name}-db-subnet-group"
    service = var.service_name
  }
}

resource "aws_db_instance" "identity_db" {
  identifier              = "${var.project_name}-${var.service_name}-db"
  engine                  = "postgres"
  engine_version          = "17"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  db_name                 = "identity_db"
  username                = "identity_admin"
  password                = var.db_password
  port                    = 5432
  db_subnet_group_name    = aws_db_subnet_group.Identity_db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  publicly_accessible     = true
  multi_az                = false
  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  tags = {
    Name    = "${var.project_name}-${var.service_name}-db"
    service = var.service_name
  }

}