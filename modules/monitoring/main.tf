resource "aws_cloudwatch_log_group" "nginx_access" {
  name              = "/${var.name_prefix}/nginx/access"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "nginx_error" {
  name              = "/${var.name_prefix}/nginx/error"
  retention_in_days = 7
}

locals {
  lb_dim = ["LoadBalancer", var.alb_arn_suffix]
  tg_dim = ["TargetGroup", var.target_group_arn_suffix, "LoadBalancer", var.alb_arn_suffix]
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.name_prefix}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          title   = "EC2 CPU utilization (%)"
          region  = var.aws_region
          view    = "timeSeries"
          stat    = "Average"
          period  = 300
          metrics = [for id in var.instance_ids : ["AWS/EC2", "CPUUtilization", "InstanceId", id]]
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          title  = "Healthy and unhealthy targets"
          region = var.aws_region
          view   = "timeSeries"
          period = 60
          metrics = [
            concat(["AWS/ApplicationELB", "HealthyHostCount"], local.tg_dim, [{ stat = "Average", label = "Healthy" }]),
            concat(["AWS/ApplicationELB", "UnHealthyHostCount"], local.tg_dim, [{ stat = "Maximum", label = "Unhealthy" }]),
          ]
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6
        properties = {
          title   = "ALB request count"
          region  = var.aws_region
          view    = "timeSeries"
          stat    = "Sum"
          period  = 60
          metrics = [concat(["AWS/ApplicationELB", "RequestCount"], local.lb_dim)]
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6
        properties = {
          title   = "Target response time (seconds)"
          region  = var.aws_region
          view    = "timeSeries"
          stat    = "Average"
          period  = 60
          metrics = [concat(["AWS/ApplicationELB", "TargetResponseTime"], local.lb_dim)]
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 12
        width  = 12
        height = 6
        properties = {
          title   = "Network in (bytes)"
          region  = var.aws_region
          view    = "timeSeries"
          stat    = "Sum"
          period  = 300
          metrics = [for id in var.instance_ids : ["AWS/EC2", "NetworkIn", "InstanceId", id]]
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 12
        width  = 12
        height = 6
        properties = {
          title   = "Target 5xx errors"
          region  = var.aws_region
          view    = "timeSeries"
          stat    = "Sum"
          period  = 60
          metrics = [concat(["AWS/ApplicationELB", "HTTPCode_Target_5XX_Count"], local.lb_dim)]
        }
      },
      {
        type   = "log"
        x      = 0
        y      = 18
        width  = 24
        height = 6
        properties = {
          title  = "Latest nginx access log lines"
          region = var.aws_region
          view   = "table"
          query  = "SOURCE '${aws_cloudwatch_log_group.nginx_access.name}' | fields @timestamp, @logStream, @message | sort @timestamp desc | limit 20"
        }
      }
    ]
  })
}
