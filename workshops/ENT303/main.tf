terraform {
  required_providers {

    aws = {

      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {

  region  = var.region

  default_tags {

    tags = {

      customer    = var.CustomerTag
      environment = var.EnvironmentTag
      provisioner = "terraform"
      workshop    = "pdo"

    }
  }

}