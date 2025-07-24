#!/bin/bash

INSTANCE_ID=$1
BUCKET_NAME=$2

aws s3 cp /var/log/cloud-init.log s3://$BUCKET_NAME/system/
aws s3 cp /var/log/app.log s3://$BUCKET_NAME/app/logs/

aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
echo "🛑 EC2 instance $INSTANCE_ID stopped and logs uploaded"
