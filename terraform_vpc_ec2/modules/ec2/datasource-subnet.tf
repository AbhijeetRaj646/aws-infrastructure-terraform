data "aws_subnet" "public_subnet" {
  filter {
    name = "tag:Name"
    values = ["Subnet-Public : Public Subnet 1"]
  }
}

data "aws_subnet" "private_subnet" {
  filter {
    name = "tag:Name"
    values = ["Subnet-Private : Private Subnet 1"]
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Demo-VPC"]
  }
}