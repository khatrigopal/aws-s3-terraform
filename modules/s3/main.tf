#S3 Bucket on Which we will add policy
resource "aws_s3_bucket" "test-bucket" {
  bucket = "${var.bucket_name}"
  force_destroy = "${var.bucket_force_destroy}"
  tags              = "${var.tags}"	
}

#Resource to add bucket policy to a bucket 
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.test-bucket.id
  policy = data.aws_iam_policy_document.public_read_access.json
}

#DataSource to generate a policy document
data "aws_iam_policy_document" "public_read_access" {
  statement {
    principals {
	  type = "*"
	  identifiers = ["*"]
	}

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.test-bucket.arn,
      "${aws_s3_bucket.test-bucket.arn}/*",
    ]
  }
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.test-bucket.id
  versioning_configuration {
    status = var.versioning
  }
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.test-bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.test-bucket.id
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}
