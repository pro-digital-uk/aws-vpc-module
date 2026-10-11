output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "Web tier subnet IDs."
  value       = aws_subnet.public[*].id
}

output "app_subnet_ids" {
  description = "App tier subnet IDs."
  value       = aws_subnet.app[*].id
}

output "db_subnet_ids" {
  description = "Data tier subnet IDs."
  value       = aws_subnet.db[*].id
}

output "db_subnet_group_name" {
  description = "DB subnet group for RDS, or null when fewer than two data subnets exist."
  value       = one(aws_db_subnet_group.this[*].name)
}

output "nat_gateway_id" {
  description = "NAT Gateway ID, or null when the NAT Gateway is disabled."
  value       = one(aws_nat_gateway.this[*].id)
}
