terraform {
  cloud {
    organization = "friends_of_fate_903"

    workspaces {
      name = "sturdy-rotary-phone"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}




provider "aws" {
  region = "us-east-1"
    default_tags {
    tags = {
      environment = "development"
      platform    = "terraform"
      repo-name   = "scaling-succotash"
      user        = "MatthewDavis"
    }
  }
}