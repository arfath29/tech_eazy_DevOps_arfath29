# 📌 Assignment 2: Extend Automation with IAM, S3, and Logging
### 📄 Description
Extend previous automation to include IAM role-based access, S3 logging, lifecycle management, and upload EC2 & app logs post-termination.

## ✅ Pre-requisites
*** Assignment 1 completed ***

*** Terraform installed ***

*** IAM user with permissions for S3 and IAM ***

*** Private S3 bucket name configured ***

## 🛠️ Tools Used
- Terraform

- AWS IAM

- AWS S3

- Bash

- AWS CLI

## 🚀 Step-by-Step Instructions
*** 1. Navigate to the terraform folder: ***
```bash
cd project-root/assignment2/terraform
```
*** 2. Initialize Terraform: ***
```bash
terraform init
```
*** 3. Set the S3 bucket name (replace with yours): ***
```bash
terraform apply -var="bucket_name=my-private-log-bucket"
```
*** 4. Attach IAM instance profile to EC2 with role allowing S3 upload. ***
*** 5. Upload logs after shutdown: ***
```bash
cd ../scripts
./upload_logs.sh my-private-log-bucket
```
*** 6. Verify logs with read-only role: ***
```bash
aws s3 ls s3://my-private-log-bucket/
```


