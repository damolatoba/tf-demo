##################################
# Copyright (c) 2022 CleanSlateTG
# By Lanre Bakare
##################################

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
  region     = var.region
}