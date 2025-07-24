#!/bin/bash
apt update
apt install -y openjdk-21-jdk maven git

git clone https://github.com/Trainings-TechEazy/test-repo-for-devops /app
cd /app
mvn clean package
nohup java -jar target/hellomvc-0.0.1-SNAPSHOT.jar > /var/log/app.log 2>&1 &
