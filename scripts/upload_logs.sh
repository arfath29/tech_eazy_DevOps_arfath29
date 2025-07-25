#!/bin/bash

BUCKET_NAME=$1
if [ -z "$BUCKET_NAME" ]; then
  echo "Bucket name is required!"
  exit 1
fi

aws s3 cp /var/log/cloud-init.log s3://$BUCKET_NAME/ec2/cloud-init.log
aws s3 cp /home/ubuntu/app/app.log s3://$BUCKET_NAME/app/logs/app.log
