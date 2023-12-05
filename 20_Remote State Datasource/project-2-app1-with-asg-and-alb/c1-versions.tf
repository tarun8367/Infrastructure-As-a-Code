#Terraform Block

terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.23"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
    # Add Random Provider in required_providers block
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }


  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terra-backend-ec2"
    key    = "dev/project2-app1/terraform.tfstate"
    region = "us-east-1" 

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "dev-project2-app1"    
  }     
}

#Provider Block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}
# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}