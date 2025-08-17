# 🤖 Roboshop Infrastructure Setup

## 🌐 Overview

This project provides a robust, production-grade infrastructure setup for the Roboshop application—an e-commerce platform for selling robots. All resources are defined as code using Terraform, enabling consistent, repeatable, and secure deployments.

### 🚀 Key Features

- 🏗️ **VPC & Subnets:** Isolated network environments for secure resource hosting.
- 🔒 **Security Groups:** Fine-grained access control for all deployed resources.
- 🛡️ **Bastion Host:** Secure SSH access to private subnets.
- 🔗 **VPN Setup:** Private connectivity for secure operations.
- 🗄️ **Database Provisioning:** Automated creation of all necessary databases.
- ⚖️ **Application Load Balancers:** Frontend and backend ALBs for optimized traffic management.
- 📜 **AWS Certificate Manager (ACM):** Automated SSL/TLS certificate management.
- 🧩 **Microservices Deployment:** Infrastructure code for deploying catalogue, user, cart, shipping, payment, and frontend services.
- 🌎 **CDN (Content Delivery Network):** Improved performance and global reach.
- 🧱 **Modular Design:** Built using the [terraform-aws-roboshop](https://github.com/BharathKumarReddy2103/terraform-aws-roboshop) module for reusability and scalability.

## 🚦 Getting Started

1. 📥 **Clone this repository.**
2. 🛠️ **Install Terraform** (version 1.12.1 or newer recommended).
3. 🔑 **Configure your AWS credentials.**
4. ✏️ **Adjust variables as needed** for your environment (see `variables.tf` or examples below).
5. 🚀 **Initialize and apply:**
   ```sh
   terraform init
   terraform plan
   terraform apply
   ```

## 💡 Example Usage

```hcl
module "roboshop" {
  source = "github.com/BharathKumarReddy2103/terraform-aws-roboshop"
  # ... your variable overrides here ...
}
```

## 🧩 Modules Used

- [terraform-aws-roboshop](https://github.com/BharathKumarReddy2103/terraform-aws-roboshop): Main reusable module powering this infrastructure.

## 📚 References

- [Roboshop Application](https://github.com/BharathKumarReddy2103/roboshop-infra-dev)
- [Roboshop Terraform AWS Module](https://github.com/BharathKumarReddy2103/terraform-aws-roboshop)

## 🤝 Contributing

Contributions are welcome. Please open issues or submit pull requests for suggestions and improvements.

## 📄 License

[MIT](LICENSE)
