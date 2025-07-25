provider "aws" {
  region = var.region
}

# EC2 instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.upload_role.name
}


