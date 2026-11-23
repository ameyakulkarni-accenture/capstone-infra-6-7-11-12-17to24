module "storage" {
  source      = "./modules/storage"
  bucket_name = var.logs_bucket_name
}

module "iam" {
  source      = "./modules/iam"
  name_prefix = var.name_prefix
  bucket_arn  = module.storage.bucket_arn
}
