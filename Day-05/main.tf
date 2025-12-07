
variable "environment" {
    default = "dev"
    type = string
  
}

variable "channel_name" {
    default = "ttw-moin"
  
}

variable "region" {
  default = "ap-south-2"
}

locals {
  env = var.environment
  bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region}" 
  vpc_name = "${var.environment}-VPC"

}

# create s3 bucket, vpc and ec2 instance
resource "aws_s3_bucket" "first_bucket" {
  #bucket = "my-first-terraform-bucket-moin-dev"
    bucket = local.bucket_name


  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
  
}

resource "aws_vpc" "sample_vpc" {
  cidr_block = "10.0.1.0/24"
  region = var.region
  tags = {
    Environment = var.environment
    Name        = local.vpc_name
  }
  
}

resource "aws_instance" "example" {
  instance_type = "t3.micro"
  #subnet_id     = aws_subnet.sample_subnet.id
  region       = var.region
    ami           = "ami-0e7938ad51d883574" # Example AMI ID for Amazon Linux 2 in us-east-1    

tags = {
    Environment = var.environment
    Name        = "${var.environment}-ec2-Instance"
  }
}

output "vpc_id" {
    value = aws_vpc.sample_vpc.id
  }
  
output "ec2_id" {
    value = aws_instance.example.id
  } 

