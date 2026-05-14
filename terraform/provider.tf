terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Note: Keeping state local for now to simplify. 
  # In a real-world scenario, we'd use the S3 buckets you listed (irfath-zota-bucket).
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "Berkeley-Assignment"
      Owner       = "Irfath"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}