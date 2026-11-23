output "logs_bucket_name" {
  value = module.storage.bucket_name
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}
