terraform {
  backend "s3" {
    bucket         = "my-gurukulam-p11-statefile"   
    key            = "env/dev/network_skeleton/module/terraform.tfstate"  
    region         = "ap-south-1"                     
  }
}


