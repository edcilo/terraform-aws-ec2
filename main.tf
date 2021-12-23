# terraform block contains Terraform settings,
# including the required providers

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


# The provider block configures the specific provider.
# A provider is a plugin that Terraform uses to create and manage
# your resources

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}


# Use resource block to define components of your infraestructure

resource "aws_instance" "app_server" {
  ami           = "ami-020db2c14939a8efb"
  instance_type = "t2.micro"

  tags = {
    name = var.instance_name
  }
}

