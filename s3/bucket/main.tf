resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id

  acl = var.bucket_acl
}

resource "aws_s3_account_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls = var.block_public_access
  block_public_policy = var.block_public_access
  ignore_public_acls = var.block_public_access
  restrict_public_buckets = var.block_public_access

}