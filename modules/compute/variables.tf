variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "instance_count" {
  description = "Number of web instances"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets to spread the instances across"
  type        = list(string)
}

variable "instance_sg_id" {
  description = "Security group for the instances"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile to attach"
  type        = string
}
