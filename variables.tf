variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "ap-northeast-3"
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "capstone"
}

variable "tags" {
  description = "Tags applied to every resource"
  type        = map(string)
  default = {
    Project = "capstone"
  }
}

variable "logs_bucket_name" {
  description = "Globally unique name for the logs bucket"
  type        = string
  default     = "capstone-logs-amea-2997"
}
