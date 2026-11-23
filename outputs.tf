output "logs_bucket_name" {
  value = module.storage.bucket_name
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "github_plan_role_arn" {
  value = module.github_oidc.plan_role_arn
}
