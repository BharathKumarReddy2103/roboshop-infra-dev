#!/bin/bash
component=$1

# Add /usr/local/bin to PATH so ansible-pull is found
export PATH=$PATH:/usr/local/bin

# Install dependencies
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

# Run ansible-pull
ansible-pull -U https://github.com/BharathKumarReddy2103/Ansible-Roboshop-Project-Using-Roles.git -e component=$component main.yaml