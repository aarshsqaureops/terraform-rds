provider "aws" {
    region = "us-east-2"
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "terraform-rds-aarsh"

  engine            = "mysql"
  engine_version    = "5.7.22"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "demodb"
  username = "admin"
  password = "password"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-0bd57eeb26da657dc"]
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Name         = "terraform-rds-aarsh"
    #Owner       = "user"
    #Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = ["subnet-0f538e3830ee89ae2", "subnet-0137f79e0f79ac457"]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

}