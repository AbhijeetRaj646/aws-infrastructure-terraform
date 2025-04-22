# 🚀 Terraform AWS Infrastructure

This repository contains Terraform configurations for provisioning AWS infrastructure. It is structured into two main directories:

- **`terraform_vpc_ec2/`**: Provisions a VPC and an EC2 instance.
- **`terraform_vpc_ec2_eks/`**: Provisions a VPC, EC2 instance, and an EKS cluster.

---

## 📁 Directory Structure
. ├── README.md ├── terraform_vpc_ec2/ │ ├── main.tf │ ├── variables.tf │ ├── outputs.tf │ ├── version.tf │ ├── terraform.tfvars │ ├── vpc.auto.tfvars │ ├── terraform.tfstate* │ └── modules/ │ ├── vpc/ │ └── ec2/ │ ├── userdetails/ │ └── datasource files ├── terraform_vpc_ec2_eks/ │ ├── main.tf │ ├── variables.tf │ ├── outputs.tf │ ├── version.tf │ ├── terraform.tfvars │ ├── vpc.auto.tfvars │ ├── terraform.tfstate* │ └── modules/ │ ├── vpc/ │ ├── ec2/ │ └── eks/


---

## 📦 terraform_vpc_ec2/

### 🌐 Features
- Custom VPC with public/private subnets
- Internet Gateway, NAT Gateway, and routing
- EC2 instance with security groups and user data

### ▶️ Usage

```bash
cd terraform_vpc_ec2
terraform init
terraform apply

📦 terraform_vpc_ec2_eks/
☸️ Features
Everything in terraform_vpc_ec2/

EKS Cluster with node group

IAM roles and Kubernetes access setup


🧱 Modules
vpc/: Manages networking (VPC, subnets, routes, IGW/NAT)

ec2/: Launches EC2 instances with AMI, user data, and security

eks/ (only in EKS folder): Provisions EKS Cluster and node groups

⚙️ Prerequisites
AWS CLI configured

Terraform v1.3 or newer

IAM permissions to create VPC, EC2, EKS, and IAM roles

🧼 Cleanup
bash
Copy
Edit
terraform destroy
🤝 Contributions
Contributions are welcome! Please open an issue or PR for improvements or bug fixes.

Let me know if you'd like this version to include images, example `terraform.tfvars`, or badges at the top!


