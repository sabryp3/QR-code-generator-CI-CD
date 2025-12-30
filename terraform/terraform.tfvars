
# terraform.tfvars
vpc_name        = "my-vpc"
vpc_cidr        = "10.0.0.0/16"
vpc_azs         = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
vpc_pub_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
tags = {
  Terraform   = "true"
  Environment = "dev"
}
eks-name    = "my-eks"
eks-version = "1.31"
aws_region  = "eu-west-2"