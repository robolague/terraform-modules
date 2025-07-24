terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "../../"

  name       = "example-vpc"
  cidr_block = "10.0.0.0/16"

  # VPC Flow Logs are enabled by default
  enable_flow_logs = true

  tags = {
    Environment = "example"
    Project     = "terraform-modules"
  }
} 