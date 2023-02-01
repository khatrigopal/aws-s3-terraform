provider "aws" {
  region = "us-east-1"
}

### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "khatrig-githubaction"
    key = "s3.tfstate"
    region = "us-east-1"
  }
}
######### S3##############
module "s3" {
  source     = "../modules/s3"
  bucket  = var.bucket_name
  }
##########################
