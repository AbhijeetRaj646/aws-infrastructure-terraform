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

# module "ec2" {
#   source         = "./modules/ec2"
#   instance_type  = var.instance_type
#   instance_name  = var.instance_name
#   depends_on = [module.vpc]
# }

# module "eks" {
#   source = "terraform-aws-modules/eks/aws"
#   cluster_name    = var.cluster_name
#   cluster_version = var.kubernetes_version
#   subnet_ids      = module.vpc.public_subnet_ids
#   # subnet_ids    = module.vpc.private_subnets
#   # vpc_id = module.vpc.vpc_id
#   # instance_types = var.k_instance_type
#   depends_on = [module.vpc]
# }

module "eks" {
  source         = "./modules/eks"
  cluster_name   = var.cluster_name

  #Pass required networking values from vpc module
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids
}

