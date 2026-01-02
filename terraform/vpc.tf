module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr



  azs            = var.vpc_azs
  public_subnets = var.vpc_pub_subnets

  enable_nat_gateway     = false
  
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  tags = var.tags
}


