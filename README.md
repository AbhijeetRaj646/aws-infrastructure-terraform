# 🌩️ Terraform AWS Infrastructure

This repository contains Terraform configurations to provision AWS infrastructure using modular design. It is divided into two main setups:

- **`terraform_vpc_ec2/`**: Creates a custom VPC and an EC2 instance.
- **`terraform_vpc_ec2_eks/`**: Creates a custom VPC, EC2 instance, and an EKS (Elastic Kubernetes Service) cluster.

---

## 📁 Project Structure

```
.
├── README.md
├── terraform_vpc_ec2/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── version.tf
│   ├── terraform.tfvars
│   ├── vpc.auto.tfvars
│   ├── terraform.tfstate*
│   └── modules/
│       ├── vpc/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       └── ec2/
│           ├── datasource-ami.tf
│           ├── datasource-subnet.tf
│           ├── main.tf
│           ├── outputs.tf
│           ├── variables.tf
│           └── userdetails/
│               └── userdatas.sh
├── terraform_vpc_ec2_eks/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── version.tf
│   ├── terraform.tfvars
│   ├── vpc.auto.tfvars
│   ├── terraform.tfstate*
│   └── modules/
│       ├── vpc/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       ├── ec2/
│       │   ├── datasource-ami.tf
│       │   ├── datasource-subnet.tf
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── variables.tf
│       │   └── userdetails/
│       │       └── userdatas.sh
│       └── eks/
│           ├── datasource-ami.tf
│           ├── main.tf
│           ├── ouputs.tf
│           └── variables.tf
```

---

## 🚀 How to Use

### Setup for VPC + EC2

```bash
cd terraform_vpc_ec2
terraform init
terraform plan
terraform apply
```

### Setup for VPC + EC2 + EKS

```bash
cd terraform_vpc_ec2_eks
terraform init
terraform plan
terraform apply
```

---

## 🧱 Module Summary

| Module | Purpose |
|--------|---------|
| `vpc`  | Sets up VPC, subnets, route tables, gateways |
| `ec2`  | Launches EC2 instance with proper networking and AMI |
| `eks`  | (Only in EKS setup) Creates EKS cluster and node group |

---

## ✅ Requirements

- [Terraform](https://www.terraform.io/) ≥ 1.3
- AWS CLI configured (`aws configure`)
- IAM access with permissions to manage VPC, EC2, IAM, and EKS resources

---

## 🧹 Cleanup

To destroy infrastructure and avoid charges:

```bash
terraform destroy
```

---

## 🤝 Contributions

Contributions are welcome! Please open an issue or a pull request.
