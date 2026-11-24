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

variable "github_repo" {
  description = "GitHub repo (owner/name) allowed to assume the CI role"
  type        = string
  default     = "ameyakulkarni-accenture@355185031/capstone-infra-6-7-11-12-17to24@1468862239"
}

variable "state_bucket_name" {
  description = "S3 bucket that holds the Terraform state"
  type        = string
  default     = "capstone-tfstate-ameya-299792"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type for the web servers"
  type        = string
  default     = "t3.micro"
}
