variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "vpc_id" {
  default = "10.0.0.0/16"
}

variable "public_subnet_ids" {

  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_ids" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

# variable "eu_availability_zone" {
#   type = list(string)
#   default = ["eu-central-1a", "eu-central-1b"]
# }
