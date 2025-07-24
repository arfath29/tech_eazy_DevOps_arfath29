#!/bin/bash

STAGE=$1
CONFIG_FILE="config/${STAGE,,}_config.sh"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "❌ Config $CONFIG_FILE not found"
  exit 1
fi

source "$CONFIG_FILE"

cd terraform
terraform init
terraform apply -auto-approve -var="region=$REGION" -var="bucket_name=$BUCKET_NAME"

INSTANCE_PROFILE=$(terraform output -raw instance_profile)
cd ..

echo "Launching EC2..."
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --count 1 \
  --instance-type "$INSTANCE_TYPE" \
  --iam-instance-profile Name="$INSTANCE_PROFILE" \
  --user-data file://scripts/user_data.sh \
  --query 'Instances[0].InstanceId' --output text)

aws ec2 wait instance-running --instance-ids $INSTANCE_ID
echo "✅ EC2 Instance Launched: $INSTANCE_ID"

PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

echo "🌐 App will be ready shortly at: http://$PUBLIC_IP/hello"
echo "⌛ Waiting 10 mins before shutdown..."

sleep 600
./scripts/shutdown_upload.sh "$INSTANCE_ID" "$BUCKET_NAME"
