output "vpc_id" {
  description = "ID of the IoT platform VPC"
  value       = aws_vpc.iot.id
}

output "vpc_cidr" {
  description = "CIDR block of the IoT platform VPC"
  value       = aws_vpc.iot.cidr_block
}

output "msk_subnet_ids" {
  description = "Subnet IDs used for MSK"
  value       = aws_subnet.msk[*].id
}

output "msk_security_group_id" {
  description = "Security group ID for MSK"
  value       = aws_security_group.msk.id
}