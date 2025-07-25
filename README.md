# DevOps Assignments – EC2 Automation & S3 Integration

## 📌 Assignment 1: Automate EC2 Deployment

### 📄 Description
Automate the creation of an EC2 instance, configure the environment, deploy a Spring MVC application, and make it accessible via a public URL.

### ✅ Pre-requisites
- AWS Free Tier Account
- IAM user with EC2 full access
- AWS CLI configured (`aws configure`)
- `jq`, `git`, `maven`, `bash` installed locally
- Key Pair created in AWS EC2
- VPC and Security Group allowing port 22 (SSH) and port 80 (HTTP)

### 🛠️ Tools Used
- AWS EC2
- AWS CLI
- Bash Scripting
- Maven
- Git
- Java 21

### 🚀 Step-by-Step Instructions

1. Clone the project locally:
   ```bash
   git clone <your-repo-url>
   cd project-root/assignment1

*** Run the script to launch EC2: ***
```bash
./scripts/start_instance.sh
```

### The instance automatically installs Java, Maven, clones repo, builds the app:

*** - GitHub Repo: https://github.com/Trainings-TechEazy/test-repo-for-devops ***
*** 2. Stop the instance after a set duration: ***
```bash
./scripts/stop_instance.sh <INSTANCE_ID> <DURATION>
```

*** 3. Choose config by passing stage: ***
```bash
./scripts/deploy_app.sh dev
```
