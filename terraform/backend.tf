
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
  backend "s3" {
    bucket = "flaskops-bucket"
    key = "terraform/flaskops.tfstate" # Path to the terraform state file
    region = var.region
    use_lockfile = true
    
  }
}