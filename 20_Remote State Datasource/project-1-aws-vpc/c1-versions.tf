#Terraform Block

terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terra-backend-ec2"
    key    = "dev/project1-vpc/terraform.tfstate"
    region = "us-east-1"

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "dev-project1-vpc"
  }

}

#Provider Block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}
