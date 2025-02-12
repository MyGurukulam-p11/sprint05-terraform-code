terraform {
  backend "s3" {
    bucket         = "demo-p11-terraform-statefile"   
    key            = "env/dev/network_skeleton/module/terraform.tfstate"  
    region         = "ap-south-1"                     
  }
}


