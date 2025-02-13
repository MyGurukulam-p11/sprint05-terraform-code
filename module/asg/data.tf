
data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "my-gurukulam-p11-statefile"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "ap-south-1"
  }
}
