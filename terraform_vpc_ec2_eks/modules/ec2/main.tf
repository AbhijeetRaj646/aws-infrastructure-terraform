resource "aws_instance" "ec2_pubic_example" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  tags = {
    Name = "EC2 Public ec2 instance 1"
  }
    user_data = file("${path.module}/userdetails/userdatas.sh")
  key_name= "docker"
  associate_public_ip_address=true
  subnet_id = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_vpc.id]
}

# resource "aws_instance" "ec2_private_example" {
#   ami = data.aws_ami.amzlinux2.id
#   instance_type = var.instance_type
#   tags = {
#     Name = "EC2 Private ec2 imstance 1"
#   }
#   key_name= "docker"
#   subnet_id = data.aws_subnet.private_subnet.id
#   vpc_security_group_ids = [aws_security_group.sg_vpc.id]
# }

resource "aws_security_group" "sg_vpc" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress                = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
  vpc_id = data.aws_vpc.selected.id
  depends_on = [data.aws_vpc.selected]
  tags = {
    Name = "SG : vpc "
  }
}

