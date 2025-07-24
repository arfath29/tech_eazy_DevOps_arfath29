# 🚀 DevOps EC2 & S3 Infrastructure Automation

This repository includes two separate but related assignments focused on automating AWS infrastructure using DevOps tools and practices.

---

## 📁 Assignment 1: EC2 Deployment & Spring Boot App Automation

### 📌 Description

This assignment automates the provisioning of an EC2 instance, installs Java 21 and Maven, deploys a Spring Boot application from GitHub, and makes it accessible over HTTP. It supports multi-stage environments like `Dev` and `Prod`.

---

### 🛠️ Tools Used

- AWS CLI
- Terraform (optional, for infra)
- Bash
- Git
- EC2 (Amazon Linux/Ubuntu)

---

### 📋 Pre-requisites

- AWS Free Tier account
- Installed on your local machine:
  - AWS CLI
  - Bash shell
  - Git
  - Terraform (optional)
- AWS IAM user with access to `ec2:*` and `iam:*`
- Configured credentials with `aws configure`

---

### 🚀 Step-by-Step Instructions

1. Clone the project repository:
   ```bash
   git clone <your-repo-url>
   cd devops-ec2-s3-infra/

```bash
aws configure
```
```bash
chmod +x scripts/*.sh
```
```bash
./scripts/ec2_setup.sh Dev
```

## 📁 Assignment 2: S3 Logging, IAM Roles & Automation Extension
### 📌 Description
This assignment extends the previous EC2 automation by:

 - Creating IAM roles with scoped permissions

 - Creating a private S3 bucket (configurable)

 - Uploading EC2 system and application logs to S3 upon shutdown

 - Applying S3 lifecycle rules to delete logs after 7 days

 - Verifying S3 access with read-only IAM role

### 🛠️ Tools Used
 - Terraform (for IAM roles, S3 bucket)

 - AWS CLI (for EC2 and S3 commands)

 - Bash scripts

 - IAM Roles and Instance Profiles

 - S3 Lifecycle Management

### 📋 Pre-requisites
Completed Assignment 1 setup

AWS Free Tier account

### Installed on your local machine:

 - Terraform

 - AWS CLI

 - Bash

### IAM permissions for:

 - s3:*

 - iam:*

 - ec2:*

### 🚀 Step-by-Step Instructions
Navigate to the project folder:

```bash
cd devops-ec2-s3-infra/
```
Initialize Terraform:

```bash
cd terraform/
terraform init
```
Apply the Terraform configuration:

```bash
terraform apply
```
Go back to root and run EC2 provisioning with app setup:

```bash
cd ..
./scripts/ec2_setup.sh Dev
```
Wait for EC2 instance to finish setup and shutdown.

Verify logs uploaded to S3:

```bash
aws s3 ls s3://<your-bucket-name>/ --recursive

```
Use the read-only role to test if logs are viewable but not downloadable.

### ✅ Summary
Assignment 1: EC2 provisioning and Spring Boot app deployment with multi-env support

Assignment 2: S3 logging, IAM role separation, and Terraform-based infrastructure extension
