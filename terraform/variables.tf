variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_azs" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_pub_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "eks-name" {
  type    = string
  default = "my-eks"
}

variable "eks-version" {
  type    = string
  default = "1.31"
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}