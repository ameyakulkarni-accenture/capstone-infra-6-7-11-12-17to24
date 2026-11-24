output "logs_bucket_name" {
  value = module.storage.bucket_name
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "github_plan_role_arn" {
  value = module.github_oidc.plan_role_arn
}

output "alb_dns_name" {
  value = module.alb.dns_name
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "instance_ids" {
  value = module.compute.instance_ids
}
