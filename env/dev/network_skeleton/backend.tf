terraform {
  backend "s3" {
    bucket         = "infinity-p11-terraform-state"   
    key            = "env/dev/network_skeleton/module/terraform.tfstate"  
    region         = "ap-south-1"                     
  }
}
