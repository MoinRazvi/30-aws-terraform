---

# 📝 **Day 3:  Creating an S3 Bucket Using Terraform**

### **Day 3 of my Terraform learning journey focused on provisioning an AWS S3 bucket using Infrastructure as Code (IaC).**

Today’s practice helped me understand how Terraform interacts with cloud services through providers and how simple it is to automate resource creation with clean, declarative configuration.

---

## 🌱 **What I Learned Today**

### **1. Terraform Provider Block**

The provider tells Terraform *which cloud platform* to interact with.
I used the AWS provider:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
```

This ensures Terraform downloads the correct AWS plugin.

---

### **2. AWS Provider Configuration**

I specified the AWS region where the S3 bucket will be created:

```hcl
provider "aws" {
  region = "ap-south-2"
}
```

---

### **3. Creating an S3 Bucket**

My first S3 bucket via Terraform! 🎉

```hcl
resource "aws_s3_bucket" "tf_test_moin_bucket" {
  bucket = "my-moin-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```

This creates a tagged S3 bucket with proper structure and naming.

---

# ⚙ **Terraform Commands Used**

```
terraform init     # Downloads AWS provider
terraform plan     # Shows what will be created
terraform apply    # Creates the bucket in AWS
```

---

# 🚀 **Key Takeaways**

* Terraform makes cloud resource creation predictable and repeatable.
* S3 bucket creation requires only a few lines of declarative code.
* Managing infrastructure with IaC is significantly cleaner than manual console work.
* Tags help organize and track resources across environments.

---
