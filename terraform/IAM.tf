resource "aws_iam_role" "s3_read_only" {
  name = "s3-read-only-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "s3_read_only_policy" {
  role = aws_iam_role.s3_read_only.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:ListBucket"],
      Resource = ["*"]
    }]
  })
}

resource "aws_iam_role" "s3_upload_only" {
  name = "s3-upload-only-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "s3_upload_only_policy" {
  role = aws_iam_role.s3_upload_only.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:PutObject"],
      Resource = ["arn:aws:s3:::${var.bucket_name}/*"]
    }]
  })
}
