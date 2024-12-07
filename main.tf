provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jpmc-pac-ec2" {
  ami = "ami-09f85944838b438c5" 
  instance_type = "t2.micro"
  #instance_type = "u-3tb1.56xlarge"

  tags = {
    Name = "jpmc-pac-ec2"
    env  = "development"
    team = "CTO-team-3"
  }
}

resource "aws_db_instance" "jpmcPaCDatabase" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "jpmcPaCDatabase"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"

  tags = {
    Name = "jpmcPaCDatabase"
    env  = "development"
    team = "CTO-team"
  }
}
