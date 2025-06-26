#!/bin/bash

component=$1
dnf install ansible -y
ansible-pull -U https://github.com/BharathKumarReddy2103/Ansible-Roboshop-Project-Using-Roles.git -e component=$1 main.yaml