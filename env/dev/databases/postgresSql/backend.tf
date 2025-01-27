terraform {
  backend "s3" {
    bucket  = "combine-force-p11-statefile"
    key     = "env/dev/databases/postgresSql/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "combine-force-p11-statefile"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "ap-south-1"
  }
}
