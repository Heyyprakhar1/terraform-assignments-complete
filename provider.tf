# providers.tf - Provider configurations

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional: Backend configuration for state storage
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "assignments/terraform.tfstate"
  #   region = "us-east-2"
  # }
}

# Default provider (Ohio)
provider "aws" {
  region = "us-east-2"  # Ohio

  # Optional: Default tags for all resources
  default_tags {
    tags = {
      Project     = "Terraform-Assignments"
      Environment = "Learning"
      CreatedBy   = "Terraform"
    }
  }
}

# Virginia provider for multi-region deployment
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"  # N. Virginia

  default_tags {
    tags = {
      Project     = "Terraform-Assignments"
      Environment = "Learning"
      CreatedBy   = "Terraform"
    }
  }
}