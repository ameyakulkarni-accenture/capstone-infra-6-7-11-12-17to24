variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "aws_region" {
  description = "Region used by the dashboard widgets"
  type        = string
}

variable "instance_ids" {
  description = "EC2 instances to show on the dashboard"
  type        = list(string)
}

variable "alb_arn_suffix" {
  description = "ARN suffix of the load balancer, used as a metric dimension"
  type        = string
}

variable "target_group_arn_suffix" {
  description = "ARN suffix of the target group, used as a metric dimension"
  type        = string
}
