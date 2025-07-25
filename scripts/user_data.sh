#!/bin/bash

STAGE=${1:-dev}
CONFIG_FILE="../config/${STAGE}_config.json"

INSTANCE_TYPE=$(jq -r .instance_type $CONFIG_FILE)
REPO_URL=$(jq -r .repo_url $CONFIG_FILE)
JAVA_VERSION=$(jq -r .java_version $CONFIG_FILE)

sudo apt update
sudo apt install -y openjdk-${JAVA_VERSION}-jdk maven git

git clone $REPO_URL app
cd app
mvn clean package

nohup java -jar target/hellomvc-0.0.1-SNAPSHOT.jar > app.log 2>&1 &
