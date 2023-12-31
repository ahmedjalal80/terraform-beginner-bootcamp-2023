terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
  cloud {
    organization = "AHMEDCORP"
    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "random" {
  #Configuration options
}

provider "aws" {
}

resource "random_string" "bucket_name" {
  lower   = true
  upper   = false
  length  = 32
  special = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name_id" {
  value = random_string.bucket_name.id
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
