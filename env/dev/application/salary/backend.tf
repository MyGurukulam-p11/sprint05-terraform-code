terraform {
  backend "s3" {
    bucket  = "otms-p11-dev-terraform-statefile"
    key     = "env/dev/application/salary/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

