variable "name_prefix" {
  description = "Prefix for IAM resource names"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo allowed to assume the role, as owner/name"
  type        = string
}

variable "state_bucket_name" {
  description = "S3 bucket that holds the Terraform state"
  type        = string
}
