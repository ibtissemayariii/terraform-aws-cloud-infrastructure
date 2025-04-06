output "web_lb_dns_name" {
  value = aws_lb.web_lb.dns_name
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "web_security_group_id" {
  value = aws_security_group.web_sg.id
}

output "private_security_group_id" {
  value = aws_security_group.private_sg.id
}
