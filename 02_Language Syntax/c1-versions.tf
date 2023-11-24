#Terraform Block

terraform {
  required_version = "~> 1.6"
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
  region  = "us-east-1"
}
