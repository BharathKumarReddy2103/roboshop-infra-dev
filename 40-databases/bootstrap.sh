#!/bin/bash
component=$1

# Install Ansible if not already installed
dnf install ansible -y

# Run ansible-pull as ec2-user (default user) so it uses IAM role metadata credentials
ansible-pull -U https://github.com/BharathKumarReddy2103/Ansible-Roboshop-Project-Using-Roles.git -e component=$component main.yaml
