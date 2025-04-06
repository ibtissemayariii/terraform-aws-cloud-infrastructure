# Terraform AWS Cloud Infrastructure Setup

This project uses **Terraform** to provision a 3-tier architecture on AWS. The infrastructure includes the following components:

- **VPC** and Subnets (Public and Private)
- **Security Groups** for the web and private instances
- **EC2 instances** (web and private)
- **Load Balancer** with Auto Scaling for the web layer
- **IAM Roles** and Policies (if needed)

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An **AWS account** with appropriate IAM permissions to create resources like EC2, VPC, Security Groups, Load Balancers, etc.
- **AWS CLI** configured with your credentials by running:
  ```bash
  aws configure
