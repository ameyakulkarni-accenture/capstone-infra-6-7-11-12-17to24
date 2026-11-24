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

module "network" {
  source      = "./modules/network"
  name_prefix = var.name_prefix
  vpc_cidr    = var.vpc_cidr
}

module "compute" {
  source                = "./modules/compute"
  name_prefix           = var.name_prefix
  instance_type         = var.instance_type
  subnet_ids            = module.network.public_subnet_ids
  instance_sg_id        = module.network.instance_sg_id
  instance_profile_name = module.iam.instance_profile_name
  log_group_access      = module.monitoring.log_group_access
  log_group_error       = module.monitoring.log_group_error
  logs_bucket_name      = module.storage.bucket_name
}

module "alb" {
  source       = "./modules/alb"
  name_prefix  = var.name_prefix
  vpc_id       = module.network.vpc_id
  subnet_ids   = module.network.public_subnet_ids
  alb_sg_id    = module.network.alb_sg_id
  instance_ids = module.compute.instance_ids
}


module "monitoring" {
  source                  = "./modules/monitoring"
  name_prefix             = var.name_prefix
  aws_region              = var.aws_region
  instance_ids            = module.compute.instance_ids
  alb_arn_suffix          = module.alb.arn_suffix
  target_group_arn_suffix = module.alb.target_group_arn_suffix
}
