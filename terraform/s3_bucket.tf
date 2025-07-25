variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

resource "aws_s3_bucket" "logs" {
  bucket = var.bucket_name
  acl    = "private"

  lifecycle_rule {
    enabled = true
    expiration {
      days = 7
    }
  }
}
