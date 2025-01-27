terraform {
  backend "s3" {
    bucket  = "combine-force-p11-statefile"
    key     = "env/dev/application/employee/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
