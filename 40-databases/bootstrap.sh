#!/bin/bash
component=$1

# Install dependencies as root using sudo
if ! command -v ansible &> /dev/null; then
  echo "Installing Ansible..."

  if command -v dnf &> /dev/null; then
    sudo dnf install -y python3 python3-pip git
  elif command -v yum &> /dev/null; then
    sudo yum install -y python3 python3-pip git
  else
    echo "Neither yum nor dnf found. Cannot install packages."
    exit 1
  fi

  sudo pip3 install ansible
fi

# Run ansible-pull (does NOT need sudo if IAM role is attached)
ansible-pull -U https://github.com/BharathKumarReddy2103/Ansible-Roboshop-Project-Using-Roles.git -e component=$component main.yaml