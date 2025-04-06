resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "Main DB Subnet Group"
  }
}

resource "aws_db_instance" "default" {
  identifier        = "mydb-instance"
  engine            = "mysql"  # Or another database engine like PostgreSQL
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  db_subnet_group   = aws_db_subnet_group.main.name
  multi_az          = false
  storage_type      = "gp2"
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]  # Restrict access to private subnet

  tags = {
    Name = "mydb-instance"
  }

  final_snapshot_identifier = "mydb-instance-snapshot"
  skip_final_snapshot       = true  # Set to false for production use
}
