terraform {
  backend "s3" {
    bucket  = "my-gurukulam-p11-statefile"
    key     = "env/dev/application/salary/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

