output "public_subnets" {
  description = "Public Subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Private Subnets"
  value       = aws_subnet.private[*].id
}

output "web_security_group" {
  description = "Web Security Group ID"
  value       = aws_security_group.web_sg.id
}

output "private_security_group" {
  description = "Private Security Group ID"
  value       = aws_security_group.private_sg.id
}
