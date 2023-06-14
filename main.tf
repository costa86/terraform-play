terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

}

provider "aws" {
  region  = var.region
  profile = "default"

}

resource "aws_instance" "server" {
  # root_block_device {
  #   encrypted = true
  # }
  # metadata_options {
  #   http_tokens = "required"
  # }
  # ami           = var.ami
  ami           = var.aws.ami
  instance_type = var.aws.instance_type
  tags          = { Name = "first-${terraform.workspace}", Environment = terraform.workspace }

}
# data "aws_instance" "server" {
#   instance_id = "i-0c8d6456f01d0d4b0"

# }
# resource "aws_instance" "back" {
#   ami           = var.ami
#   instance_type = data.aws_instance.server.instance_type
#   tags          = { Name = "second-${terraform.workspace}", Environment = terraform.workspace }

# }

# resource "aws_instance" "others" {
#   root_block_device {
#     encrypted = true
#   }
#   metadata_options {
#     http_tokens = "required"
#   }
#   count         = 2
#   instance_type = var.instance_type
#   ami           = var.ami
#   tags          = { Name = "${count.index}-${terraform.workspace}", Environment = terraform.workspace }

# }

# resource "aws_iam_user" "iam_users" {
#   for_each = var.iam_users
#   name     = each.key
# }



