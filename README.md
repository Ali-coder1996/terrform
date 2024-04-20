# Provisioning AWS EKS Cluster with Terraform

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- Make sure you have AWS CLI & Terraform (v1.1.8 or later) installed, and the needed profiles & credentials per environment are configured in your home directory under ~/.aws/.


- There is environment specific variables values assignment files to configure each environment as needed. For example, devVariables.tfvars & prodVariables.tfvars.

**This Terraform template should provision the below cloud services & resources for each environment:**

- EKS Cluster & Node Group
- IAM Roles & Polices

## Usage

### 1. Initialize Terraform
```
terraform init
```
### 2. Review and Modify Configuration
Review the **devVariables.tfvars** file to ensure it matches your requirements. You may need to modify parameters such as region, EKS version, etc., according to your preferences.

### 3. Plan the Execution
```
terraform plan -var-file="EnvVarilablesValuesAssignmentFileName" | For example, -var-file="devVariables.tfvars"
```
Review the plan to ensure it aligns with your expectations.

### 4. Apply the Configuration
```
terraform apply -var-file="EnvVarilablesValuesAssignmentFileName" | For example, -var-file="devVariables.tfvars"
```

### 4.Destroy!

To destroy the environment and to delete all the resources that were created by Terraform for a specific environment, run the below command:

```
terraform destroy -var-file="EnvVarilablesValuesAssignmentFileName" | For example, -var-file="devVariables.tfvars"
```