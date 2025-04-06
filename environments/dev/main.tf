terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile   # Optional if you use specific AWS profiles
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"  # You can change this or make it environment-specific
}

variable "aws_profile" {
  description = "AWS profile for authentication"
  type        = string
  default     = "default"   # Set to the profile name you use (if any)
}
