terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.6.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

# provider "aws" {
#   alias = "external"
#   profile = "smt"
#   region     = var.region
# }