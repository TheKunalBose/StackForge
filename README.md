# 🚀 Terraform Infrastructure Deployment with Jenkins CI/CD

Welcome to the Terraform Infrastructure-as-Code (IaC) project!  
This repository helps you deploy and manage a complete AWS environment using **modular Terraform** and a robust **CI/CD pipeline in Jenkins**.

---

## 📁 Project Structure

terraform-infra/
├── modules/ # Reusable Terraform modules
│ ├── vpc/
│ ├── ec2/
│ └── eks/
├── environments/
│ ├── dev/ # Dev environment Terraform configs
│ └── prod/ # Prod environment Terraform configs
├── Jenkinsfile # CI/CD pipeline for automated deployment
└── README.md # This file 
---

## 🛠 Tech Stack

- 🧱 **Terraform** — Infrastructure as Code
- 🧩 **Modular Design** — Reusable, isolated modules
- ☁️ **AWS** — Scalable cloud infrastructure
- ⚙️ **Jenkins** — CI/CD automation pipeline
- 🔐 **IAM, S3, DynamoDB** — Secure backend & state locking

---

## 🚀 Features

- Multi-environment setup: `dev` and `prod`
- Remote state management with locking
- Fully automated deployment via Jenkins
- Reusable and readable Terraform modules
- Scalable VPC, subnets, EC2, EKS configurations

---

## 📂 Environments

| Environment | Path                | Backend State Key        |
|-------------|---------------------|---------------------------|
| 🧪 Dev       | `environments/dev`  | `dev/terraform.tfstate`  |
| 🚀 Prod      | `environments/prod` | `prod/terraform.tfstate` |

---

## 🤖 CI/CD Pipeline (Jenkins)

- Auto checkout from GitHub
- Initialize and validate Terraform
- Generate plan
- Optional approval-based apply
- Integrated with AWS IAM credentials via Jenkins

---

## 📚 Modules Included

| Module | Description                        |
|--------|------------------------------------|
| `vpc`  | Custom VPC with subnets & gateways |
| `ec2`  | EC2 instance deployment             |
| `eks`  | EKS cluster setup with node groups  |

---
