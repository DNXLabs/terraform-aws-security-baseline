resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name  # Replace with your desired bucket name

  acl    = "private"
  # Set the bucket access control. Options: private, public-read, public-read-write, aws-exec-read, authenticated-read

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
  }

  versioning {
    enabled = true  # Enable versioning for the bucket
  }

  lifecycle {
    prevent_destroy = false  # Set to true to prevent accidental bucket deletion
  }

  logging {
    target_bucket = "logs-audit-bucket"  # Replace with the target bucket to store access logs
    target_prefix = "logs/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"  # Use server-side encryption with AES256
      }
    }
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

}

resource "aws_s3_bucket_public_access_block" "s3_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


