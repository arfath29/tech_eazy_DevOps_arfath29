#!/bin/bash

INSTANCE_ID=$1
SLEEP_TIME=${2:-1800}  # default 30 min

sleep $SLEEP_TIME
aws ec2 stop-instances --instance-ids $INSTANCE_ID

echo "Stopped EC2 instance: $INSTANCE_ID"
