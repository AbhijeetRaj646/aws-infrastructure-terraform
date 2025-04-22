☁️ Terraform AWS Infrastructure Deployment
This repository provides Terraform configurations to deploy scalable AWS infrastructure using modular components. It is divided into two main folders for separate use cases:

terraform_vpc_ec2/ – Provisions a custom VPC along with an EC2 instance.

terraform_vpc_ec2_eks/ – Provisions a custom VPC, EC2 instance, and an EKS (Elastic Kubernetes Service) cluster.

🗂️ Repository Structure

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
│       ├── vpc/                    # Custom VPC setup
│       └── ec2/                    # EC2 instance provisioning
├── terraform_vpc_ec2_eks/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── version.tf
│   ├── terraform.tfvars
│   ├── vpc.auto.tfvars
│   ├── terraform.tfstate*
│   └── modules/
│       ├── vpc/                    # Custom VPC setup
│       ├── ec2/                    # EC2 instance provisioning
│       └── eks/                    # EKS cluster provisioning


📦 terraform_vpc_ec2/ – VPC + EC2 Deployment
💡 What it does:
Creates a custom VPC

Sets up public/private subnets, route tables, and Internet Gateway

Provisions an EC2 instance in a public subnet

Applies security groups, IAM roles, and user data

👇 How to use:

terraform init
terraform plan
terraform apply

📦 terraform_vpc_ec2_eks/ – VPC + EC2 + EKS Deployment
💡 What it does:
Everything from terraform_vpc_ec2/

Plus provisioning of a highly available Amazon EKS cluster

Node group for worker nodes

IAM roles and policies required for Kubernetes control plane and node group access

👇 How to use:
cd terraform_vpc_ec2_eks
terraform init
terraform plan
terraform apply

🧱 Modules Overview
Each major infrastructure component is defined as a Terraform module:

modules/vpc/
VPC, Subnets, Internet Gateway, NAT Gateway, Route Tables

modules/ec2/
EC2 instance provisioning

User data script (userdatas.sh) for bootstrapping

AMI and subnet data sources

modules/eks/ (only in terraform_vpc_ec2_eks/)
EKS Cluster setup

IAM roles, policies, and node group creation

EKS-related data sources

⚙️ Variable Management
Input variables: defined in variables.tf

Default or environment-specific values:

terraform.tfvars

vpc.auto.tfvars (auto-loaded)

Update these files to match your AWS environment and desired configuration.

🔐 Prerequisites
AWS CLI configured with your credentials

Terraform ≥ 1.3

IAM permissions for VPC, EC2, IAM, and EKS resources

🧹 Cleanup
To destroy all created resources:

bash
Copy
Edit
terraform destroy
📬 Contributions
Feel free to open issues or pull requests for improvements, extensions, or fixes.




