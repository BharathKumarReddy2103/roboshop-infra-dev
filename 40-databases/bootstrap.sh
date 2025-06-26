#!/bin/bash

component=$1

# Export AWS credentials from ec2-user's environment so that root can access them
export AWS_ACCESS_KEY_ID=$(sudo -u ec2-user bash -c 'echo $AWS_ACCESS_KEY_ID')
export AWS_SECRET_ACCESS_KEY=$(sudo -u ec2-user bash -c 'echo $AWS_SECRET_ACCESS_KEY')
export AWS_DEFAULT_REGION=$(sudo -u ec2-user bash -c 'echo $AWS_DEFAULT_REGION')

# Install ansible if not already present
dnf install ansible -y

# Run ansible-pull with the component argument
ansible-pull -U https://github.com/BharathKumarReddy2103/Ansible-Roboshop-Project-Using-Roles.git -e component=$component main.yaml