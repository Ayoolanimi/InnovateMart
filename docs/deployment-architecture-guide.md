# Project Bedrock — Deployment & Architecture Guide

## Overview
- VPC with public + private subnets across 2 AZs.
- EKS cluster hosting microservices and initial in-cluster persistence (MySQL, Postgres, Redis, RabbitMQ, DynamoDB Local).
- GitHub Actions with OIDC to run Terraform (plan/apply). After apply, Actions deploys k8s manifests.
- Developer access: IAM user `dev-readonly` mapped in aws-auth -> Kubernetes user `developer-readonly` and ClusterRole `cluster-readonly`.

## How to deploy (short)
Prereqs:
- AWS account & permissions, GitHub repo, Terraform CLI, AWS CLI v2, kubectl.

1. Clone repo:
   `git clone git@github.com:YOUR_ORG/YOUR_REPO.git`
2. Configure backend (optional) and fill `infra/terraform/variables.tf` placeholders.
3. Create GitHub OIDC role in AWS and add secrets `AWS_ACCOUNT_ID` and `AWS_REGION`.
4. Locally or via GitHub Actions:
