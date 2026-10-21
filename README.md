# Secure AWS Identity and Access Management (IAM) with Terraform

## Overview
This project implements secure cloud access control using **Terraform** as Infrastructure as Code (IaC). It adheres strictly to the **principle of least privilege**, ensuring that users and groups are granted only the minimum permissions necessary to perform their roles—eliminating broad administrative access risks.

---

## Architecture Components

- **IAM Developer Group (`secure-iam-demo-developers-group`)**: A centralized group designed to manage engineering permissions at scale.
- **Custom Least-Privilege Policy (`cloudwatch-read-policy`)**: A fine-grained JSON policy restricting actions strictly to CloudWatch metrics monitoring and log stream read operations (`cloudwatch:Describe*`, `logs:GetLogEvents`, etc.), preventing any infrastructure tampering.
- **IAM User (`alex-cloud-dev`)**: An example individual cloud developer profile securely nested within the developer group membership.

---

## Project Directory Structure

```text
aws-secure-iam/
├── .gitignore          # Excludes local Terraform state and lock files
├── providers.tf        # Configures the AWS provider and version constraints
├── variables.tf        # Defines customizable environment naming parameters
└── iam.tf              # Provisions IAM groups, custom least-privilege policies, and users