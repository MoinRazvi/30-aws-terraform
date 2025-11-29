terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket        = "moin-terraform-state-bucket"
    key           = "dev/terraform.tfstate"
    region        = "ap-south-2"
    use_lockfile  = true
    encrypt       = true
  }
}

# AWS Provider
provider "aws" {
  region = "ap-south-2"
}

# Random suffix for test bucket
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Test S3 bucket resource
resource "aws_s3_bucket" "test_backend" {
  bucket = "test-remote-backend-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "Test Backend Bucket"
    Environment = "dev"
  }
}
