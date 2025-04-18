resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Demo-VPC"
  }
}

# Setup public subnet
resource "aws_subnet" "aws_public_subnets" {
  count      = length(var.cidr_public_subnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "Subnet-Public : Public Subnet ${count.index + 1}"
  }
}

# Setup private subnet
resource "aws_subnet" "aws_private_subnets" {
  count      = length(var.cidr_private_subnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "Subnet-Private : Private Subnet ${count.index + 1}"
  }
}


resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "IGW"
  }
}


resource "aws_eip" "nat_eip" {
  count = length(var.cidr_private_subnet)
   domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  count      = length(var.cidr_private_subnet)
  depends_on = [aws_eip.nat_eip]
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id = aws_subnet.aws_private_subnets[count.index].id
  tags = {
    "Name" = "Private NAT GW "
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }
  tags = {
    Name = "RT Public "
  }
}

resource "aws_route_table" "private_route_table" {
  count      = length(var.cidr_private_subnet)
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.nat_gateway]
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }
  tags = {
    Name = "RT Private"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count = length(var.cidr_public_subnet)
  depends_on = [aws_subnet.aws_public_subnets, aws_route_table.public_route_table]
  subnet_id      = element(aws_subnet.aws_public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.cidr_private_subnet)
  depends_on = [aws_subnet.aws_private_subnets, aws_route_table.private_route_table]
  subnet_id      = element(aws_subnet.aws_private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_route_table[count.index].id
}