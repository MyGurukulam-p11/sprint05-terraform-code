terraform {
  backend "s3" {
    bucket  = "my-gurukulam-p11-statefile"
    key     = "env/dev/application/attendance/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
