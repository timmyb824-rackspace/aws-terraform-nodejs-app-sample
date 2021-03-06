# use aws provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

#configure the aws provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#configure the aws instance
resource "aws_instance" "terraform-testing-tab" {
  ami           = "ami-04d29b6f966df1537"
  instance_type = "t2.small"
  vpc_security_group_ids = [ "ENTER VALUE HERE" ]
  user_data = file("userdata.sh")
  tags = {
    enviroment = "playground"
    appid-or-sso = var.sso
    needed-until-date = "2021-12-31"
    tag-std = "v1.0"
    terraform = "test-instance"
  }
}
