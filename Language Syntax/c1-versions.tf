#Terraform Block

terraform{
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source = ""
      version = "value"
    }
  }
}