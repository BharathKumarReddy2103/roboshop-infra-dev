# 🛠️ roboshop-infra-setup

This repository provides a **production-grade infrastructure setup** for the Roboshop Application, a microservices-based e-commerce platform for selling robots.

It uses **Terraform** and modular IaC principles to provision everything required to run Roboshop in a secure, scalable, and highly available environment on AWS.

---

## 🔧 Project Modules

This repo integrates with the reusable Terraform module:
👉 [`terraform-aws-roboshop`](https://github.com/BharathKumarReddy2103/terraform-aws-roboshop)

---

## 🧱 Infrastructure Components

The following AWS services and components are provisioned:

### 1. **Networking**
- VPC with public and private subnets
- Internet Gateway (IGW) and NAT Gateway
- Route Tables and associations
- Bastion Host (jumpbox for SSH into private subnets)
- Site-to-Site VPN for secure on-premise connectivity

### 2. **Security**
- Fine-grained **Security Groups** for each component
- IAM roles and policies for access control
- TLS certificates via **AWS Certificate Manager (ACM)**

### 3. **Compute**
- EC2 instances for Bastion and other services
- Auto Scaling Groups behind Application Load Balancers (ALBs)
- Separate ALBs for **frontend** and **backend** microservices

### 4. **Storage & Databases**
- Amazon RDS (MySQL/PostgreSQL)
- MongoDB and Redis (self-managed or AWS-hosted)
- EBS volumes for persistent storage

### 5. **Microservices Deployment**
Infrastructure setup for the following services:
- `catalogue`
- `user`
- `cart`
- `shipping`
- `payment`
- `frontend`

### 6. **CDN (Content Delivery Network)**
- AWS CloudFront integration with ACM and ALB
- Caching and HTTPS termination at the edge

---

## 📁 Repository Structure

```

roboshop-infra-setup/
│
├── vpc/                  # VPC, subnets, route tables
├── security-groups/      # SGs for each service
├── bastion/              # Bastion host setup
├── vpn/                  # VPN tunnel config
├── acm/                  # ACM TLS certificates
├── databases/            # RDS, MongoDB, Redis
├── frontend-alb/         # Load balancer for frontend
├── backend-alb/          # Load balancer for backend
├── services/             # Microservices (catalogue, user, etc.)
├── cdn/                  # CloudFront CDN configuration
└── acm                   # AWS Certificate Manager

````

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/BharathKumarReddy2103/roboshop-infra-setup.git
cd roboshop-infra-setup
````

### 2. Configure Terraform

Ensure you have:

* AWS credentials configured (`~/.aws/credentials`)
* Backend (S3/DynamoDB) setup for state locking (if needed)

### 3. Initialize and Apply

```bash
terraform init
terraform plan
terraform apply
```

---

## ✅ Prerequisites

* Terraform v1.12+
* AWS CLI configured
* IAM user with required permissions
* Domain name for ACM and CDN setup

---

## 📌 Best Practices Followed

* Modular and reusable code
* Infrastructure as Code (IaC)
* Secure by default (least privilege IAM, VPC design)
* HTTPS with ACM and CloudFront
* Scalable architecture using ALB and ASGs

---

## 📚 Related Projects

* [terraform-aws-roboshop](https://github.com/BharathKumarReddy2103/terraform-aws-roboshop): Reusable Terraform module for Roboshop
* [roboshop-microservices](https://github.com/BharathKumarReddy2103): Source code and deployment scripts (if available)

---

## 🙋‍♂️ Author

**Bharath Kumar Reddy**
Senior DevOps & Cloud Engineer
🔗 [LinkedIn](https://linkedin.com/in/bharathkumar-reddy-n)

---

## 📜 License

This project is licensed under the [MIT License](LICENSE)
