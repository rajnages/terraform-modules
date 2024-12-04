terraform {
  # required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  # profile = var.profile
}

# Call the VPC module
module "vpc" {
  source           = "./modules/vpc"
  vpc_name         = "my-vpc-${terraform.workspace}"
  cidr_block       = var.cidr_block
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  # enable_nat_gw    = var.enable_nat_gw
  availability_zones = var.availability_zones
  tags = {
    Environment = terraform.workspace
  }
}