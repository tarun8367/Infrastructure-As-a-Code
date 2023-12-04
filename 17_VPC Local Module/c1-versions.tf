#Terraform Block

terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Provider Block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}
