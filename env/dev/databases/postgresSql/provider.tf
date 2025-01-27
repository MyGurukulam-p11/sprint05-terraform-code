terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  
      version = "~> 5.82.2"         
    }
  }

  required_version = ">= 1.9.8" 
}

provider "aws" {
  region  = "ap-south-1" 
}
