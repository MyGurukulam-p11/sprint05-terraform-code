terraform {
  backend "s3" {
    bucket         = "otms-p11-dev-terraform-statefile"   
    key            = "env/dev/network_skeleton/module/terraform.tfstate"  
    region         = "ap-south-1"                     
  }
}


