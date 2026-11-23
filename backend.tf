terraform {
  backend "s3" {
    bucket       = "capstone-tfstate-ameya-299792"
    key          = "capstone/terraform.tfstate"
    region       = "ap-northeast-3"
    encrypt      = true
    use_lockfile = true
  }
}
