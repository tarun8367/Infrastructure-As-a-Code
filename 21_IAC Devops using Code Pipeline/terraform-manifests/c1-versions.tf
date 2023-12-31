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
  # Adding backend as S3 for remote state storage
  backend "s3" {}
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