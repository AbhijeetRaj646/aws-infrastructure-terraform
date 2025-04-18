provider "aws" {
  region = var.region
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  cidr_public_subnet = var.cidr_public_subnet
  cidr_private_subnet = var.cidr_private_subnet
  eu_availability_zone  = var.eu_availability_zone
}

module "ec2" {
  source         = "./modules/ec2"
  instance_type  = var.instance_type
  instance_name  = var.instance_name
  depends_on = [module.vpc]
}
