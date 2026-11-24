variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC for the target group"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets (two AZs) for the ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group for the ALB"
  type        = string
}

variable "instance_ids" {
  description = "Instances to register as targets"
  type        = list(string)
}
