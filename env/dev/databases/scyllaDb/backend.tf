terraform {
  backend "s3" {
    bucket  = "infinity-p11-terraform-state"
    key     = "env/dev/databases/scyllaDb/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
