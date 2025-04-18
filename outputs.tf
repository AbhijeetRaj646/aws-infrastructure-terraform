output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id_1" {
  value = module.ec2.instance_ids[0]
}




