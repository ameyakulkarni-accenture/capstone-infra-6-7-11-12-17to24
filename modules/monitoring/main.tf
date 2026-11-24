resource "aws_cloudwatch_log_group" "nginx_access" {
  name              = "/${var.name_prefix}/nginx/access"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "nginx_error" {
  name              = "/${var.name_prefix}/nginx/error"
  retention_in_days = 7
}
