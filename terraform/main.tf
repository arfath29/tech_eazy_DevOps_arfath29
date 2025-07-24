provider "aws" {
  region = var.region
}

# IAM trust policy
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Role A: S3 read-only
resource "aws_iam_role" "readonly_role" {
  name               = "readonly_s3"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy" "readonly_policy" {
  role = aws_iam_role.readonly_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:ListBucket"],
      Resource = "*"
    }]
  })
}

# Role B: Upload-only for EC2
resource "aws_iam_role" "upload_role" {
  name               = "upload_s3_only"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy" "upload_policy" {
  role = aws_iam_role.upload_role.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject"],
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

# EC2 instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.upload_role.name
}

# S3 bucket
resource "aws_s3_bucket" "logs_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

# Lifecycle rule
resource "aws_s3_bucket_lifecycle_configuration" "logs_lifecycle" {
  bucket = aws_s3_bucket.logs_bucket.id

  rule {
    id     = "delete-old-logs"
    status = "Enabled"

    expiration {
      days = 7
    }

    filter {
      prefix = "app/logs/"
    }
  }
}
