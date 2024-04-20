terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

provider "aws" {
    profile = var.awsProfileName
    region  = var.awsRegion
}