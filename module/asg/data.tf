
data "terraform_remote_state" "network_skeleton_state" {
  backend = "s3"

  config = {
    bucket = "otms-p11-dev-terraform-statefile"
    key    = "env/dev/network_skeleton/module/terraform.tfstate"
    region = "ap-south-1"
  }
}