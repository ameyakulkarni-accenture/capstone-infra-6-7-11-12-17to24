output "log_group_access" {
  value = aws_cloudwatch_log_group.nginx_access.name
}

output "log_group_error" {
  value = aws_cloudwatch_log_group.nginx_error.name
}
