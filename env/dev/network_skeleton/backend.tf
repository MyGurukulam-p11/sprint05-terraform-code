terraform {
  backend "s3" {
    bucket         = "combine-force-p11-statefile"   
    key            = "env/dev/network_skeleton/module/terraform.tfstate"  
    region         = "ap-south-1"                     
  }
}