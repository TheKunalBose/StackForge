#!/bin/bash
sudo yum update -y
sudo yum install -y java-1.8.0-openjdk-devel
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
