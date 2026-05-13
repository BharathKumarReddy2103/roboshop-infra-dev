#!/bin/bash
set -ex

component=$1
env=$2
dnf install git -y
dnf install ansible -y
ansible-pull -U https://github.com/BharathKumarReddy2103/ansible-roboshop-roles-tf.git -e component=$1 -e env=$2 main.yaml