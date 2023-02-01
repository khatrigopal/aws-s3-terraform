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
  bucket_name  = var.bucket_name
  #force_destroy = var.bucket_force_destroy
  }
  
 resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = var.versioning
  }
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.s3-bucket.id
  acl    = var.acl
}
##########################
