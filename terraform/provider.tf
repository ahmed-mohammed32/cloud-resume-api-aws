terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
    required_version = ">= 1.3.0"
}

# Configure the AWS Provider to my desired region
provider "aws" {
  region = "us-east-1"
}
