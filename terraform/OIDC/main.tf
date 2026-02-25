terraform {
  required_version = "~> 1.0"
  backend "s3" {
    bucket         = "infrabucket-s3"
    key            = "terraform/state.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "tf-db-table"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.7"
    }

  }
}

provider "aws" {
  region = var.aws_region
}
