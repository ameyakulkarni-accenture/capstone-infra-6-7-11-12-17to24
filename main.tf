module "storage" {
  source      = "./modules/storage"
  bucket_name = var.logs_bucket_name
}

module "iam" {
  source      = "./modules/iam"
  name_prefix = var.name_prefix
  bucket_arn  = module.storage.bucket_arn
}

module "github_oidc" {
  source            = "./modules/github_oidc"
  name_prefix       = var.name_prefix
  github_repo       = var.github_repo
  state_bucket_name = var.state_bucket_name
}
