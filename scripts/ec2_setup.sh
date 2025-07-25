#!/bin/bash

# Start EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id ami-0c55b159cbfafe1f0 \
  --instance-type t2.micro \
  --key-name techeazy-key \
  --security-groups techeazy-sg \
  --iam-instance-profile Name=ec2-role-with-s3 \
  --user-data file://deploy_app.sh \
  --query 'Instances[0].InstanceId' --output text)

echo "Started EC2 instance: $INSTANCE_ID"
