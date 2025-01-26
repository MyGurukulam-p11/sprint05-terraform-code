
data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "combine-force-p11-statefile"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "us-east-1"
  }
}

