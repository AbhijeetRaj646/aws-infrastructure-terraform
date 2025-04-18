output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [for subnet in aws_subnet.aws_public_subnets : subnet.id]
}

output "private_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [for subnet in aws_subnet.aws_private_subnets : subnet.id]
}