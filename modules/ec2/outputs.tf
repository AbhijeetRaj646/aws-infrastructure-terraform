output "instance_id_public" {
  value = aws_instance.ec2_pubic_example.id
}

output "instance_ids" {
  value = aws_instance.ec2_pubic_example.*.id
}



