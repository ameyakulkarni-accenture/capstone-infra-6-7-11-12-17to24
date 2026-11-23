variable "name_prefix" {
  description = "Prefix for IAM resource names"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket the role may read and write"
  type        = string
}
