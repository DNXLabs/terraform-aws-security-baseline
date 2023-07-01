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
