module "mysql_db" {
#  source  = "./modules/terraform-aws-rds"
  source  = "terraform-aws-modules/rds/aws"
  parameter_group_name = "prod-with-logging"

  # version = "~> 2.0"

  identifier = "iicerge"

  engine            = "mysql"
  engine_version    = "8.0.23"
  instance_class    = "db.t2.large"
  allocated_storage = 500

  name     = "mysql_db"
  username = "root"
  #password = "14M50Toy"
  password = "14M50Toy2021"
  port     = "3306"

  iam_database_authentication_enabled = false

  vpc_security_group_ids =[aws_security_group.SF_DB_Security_Group.id]
  #vpc_security_group_ids = "sg-0d6726d233d9a5cde"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]
  backup_retention_period = 7
  
  multi_az = true

  tags = {
    Project       = "ge"
    Environment = "prod"
  }
  

  # DB subnet group
  subnet_ids = module.vpc.database_subnets

  # Database Deletion Protection
  deletion_protection = true
  
  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"
  
  apply_immediately = true  

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
      apply_method = "pending-reboot" 
    },
    {
      name  = "character_set_server"
      value = "utf8"
      apply_method = "pending-reboot" 
    },
    {
      name  = "lower_case_table_names"
      value = "1"
      apply_method = "pending-reboot" 
    },
    {
      name  = "log_bin_trust_function_creators"
      value = "1"
      apply_method = "pending-reboot" 
    },
    {
      name  = "max_connections"
      value = "5000"
      apply_method = "pending-reboot" 
    },
    {
      name  = "time_zone"
      value = "Asia/Singapore" # no Thimpu
    },
    {
      name  = "log_output"
      value = "file" 
    },
    {
      name  = "slow_query_log"
      value = "1" 
    },
    
  ]

}