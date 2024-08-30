terraform {
  // This section tells Terraform which cloud providers
  // you want to use. In this we use AWS:
  required_providers {
    aws = {
        //source of the AWS provider:
        source = "hashicorp/aws"
        version = "~> 4.18"
    }
  }

//Version of terraform required:
  required_version = ">= 1.2.0"
}

// In which you are going to create AWS:
provider "aws" {
  region = "us-east-2"
}

// this block create EC2 instance of t2 micro:
resource "aws_instance" "app_server" {

  // AMI - Amazon Machine Image used to create
  // Amazon virtual server.
  ami = "ami-830c94e3"
  instance_type = "t2.micro"

// Allows to add metadata:
  tags = {
    Name = "ExampleAppServerInstance"
  }
}