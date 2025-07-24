output "bucket_name" {
  value = aws_s3_bucket.logs_bucket.id
}
output "instance_profile" {
  value = aws_iam_instance_profile.ec2_profile.name
}
