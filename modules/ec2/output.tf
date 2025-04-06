output "web_instance_id" {
  value = aws_instance.web_instance.id
}

output "private_instance_id" {
  value = aws_instance.private_instance.id
}
