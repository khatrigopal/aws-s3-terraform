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
  versioning = "${var.versioning}"
  acl        = "${var.s3_acl}"
}

  ############## ECR ###################
  
  module "ecr-repo" {
  source           = "./../modules/ecr"
  ecr_name         = var.ecr_name
  tags             = var.tags
  image_mutability = var.image_mutability

}
