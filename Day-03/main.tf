terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "ap-south-2"
}

# Create a S3 bucket
resource "aws_s3_bucket" "tf_test_moin_bucket" {
  bucket = "my-moin-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Deva"
  }
}