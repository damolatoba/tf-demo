terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.6.0"
    }
  }
}

provider "aws" {
  profile = "bmwsso"
  region  = "eu-west-1"
}