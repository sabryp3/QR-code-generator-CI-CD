terraform {
  required_version = "~> 1.0"
  backend "s3" {
    bucket         = "tf-state-bucket"
    key            = "gitops-actions/state.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "tf-db-table"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16"
    }
    htpasswd_password = {
      source  = "loafoe/htpasswd"
      version = "1.5.0"
    }
  }
}