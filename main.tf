provider "aws" {
#   version = "~> 3.0"
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = var.region
}

# Define s3 bucket and dynamoDB to store statefile and lock statefile
terraform {
  backend "s3" {
    bucket = "ge-terraformtfstate"
    key = "prod-terraform/terraform.tfstate"
    dynamodb_table = "ge-prod-dynamodb-statelock"
    region = "ap-southeast-1"
  }
} 
