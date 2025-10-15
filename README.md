# Terraform AWS Assignments 1-5

## 📋 Project Overview
Complete implementation of 5 Terraform assignments deploying AWS infrastructure across multiple regions.

## 🎯 Assignments Completed

### ✅ Assignment 1: Basic EC2 in Ohio
- EC2 instance in us-east-2 (Ohio) region
- Instance: `assignment1-ohio-instance`

### ✅ Assignment 2: EC2 with Elastic IP
- EC2 instance with associated Elastic IP
- Demonstrates static IP assignment

### ✅ Assignment 3: Multi-Region Deployment
- **Ohio**: `hello-ohio` (us-east-2)
- **Virginia**: `hello-virginia` (us-east-1)

### ✅ Assignment 4: VPC with EC2 Instance
- Custom VPC with public subnet
- Complete networking stack (IGW, Route Table, Security Group)
- EC2 instance deployed within VPC

### ✅ Assignment 5: EC2 with Apache Web Server
- User data script installing Apache
- Automatic IP address export to local file

## 🛠️ Architecture
- Single main.tf file with all assignments
- Conditional deployment using variables
- Multi-region provider configuration
- Modular resource naming and tagging

## 📁 File Structure
terraform-assignments/
├── main.tf # All resource configurations
├── providers.tf # AWS provider setup (Ohio + Virginia)
├── variables.tf # Assignment toggle variables
├── outputs.tf # Terraform outputs
└── README.md # Documentation

text

## 🚀 Deployment
```bash
terraform init
terraform apply -auto-approve
