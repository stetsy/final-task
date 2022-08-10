module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "s3-final-task-devops4"
  //acl    = "private"

  versioning = {
    enabled = false
  }

}

resource "aws_s3_bucket" "terraform_bucket" {
      bucket = "prod-terraform-state-backend-114590890903"
      acl    = "private"
      region = "us-west-2"
      versioning {
          enabled = true
      }
    
      tags = {
          Name = "S3 Remote Terraform State Store"
      }
  }

terraform {
   backend "s3" {
     bucket         = "prod-terraform-state-backend-114590890903"
     key            = "terraform.tfstate"
     region         = "us-west-2"

  
   }
