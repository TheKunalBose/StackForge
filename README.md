# 🏢 StackForge-Infrastructure
# 🚀 Terraform Infrastructure Deployment with Jenkins CI/CD

Welcome to the Terraform Infrastructure-as-Code (IaC) project!  
This repository helps you deploy and manage a complete AWS environment using **modular Terraform** and a robust **CI/CD pipeline in Jenkins**.

---

## 📁 Project Structure
```text
StackForge-Terraform-Infra/
├── backend.tf              # Backend configuration for remote state storage
├── main.tf                 # Primary Terraform configuration file
├── variables.tf            # Variable declarations
├── outputs.tf              # Output values
├── terraform.tfvars        # Variable values specific to this environment
├── modules/                # Reusable Terraform modules
│   ├── vpc/                # VPC module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── eks/                # EKS cluster module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── node_group/         # EKS node group module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/           # Environment-specific configurations
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
└── README.md               # Project documentation
```

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
