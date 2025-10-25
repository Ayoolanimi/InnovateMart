# InnovateMart — Project Bedrock EKS Deployment

This repo contains IaC and Kubernetes manifests to provision an EKS cluster and deploy the retail-store-sample-app.

## Quickstart (placeholders must be filled)

1. Fill placeholders in `infra/terraform/variables.tf` (AWS account id, ssh key).
2. (Optional) Configure S3 backend in `infra/terraform/backend.tf`.
3. Create GitHub Actions OIDC role in AWS:
   - Trust policy: `infra/terraform/iam/github-oidc-trust-policy.json`
   - Attach policy: `infra/terraform/iam/github-oidc-role-policy.json`
4. Add GitHub secrets: `AWS_ACCOUNT_ID`, `AWS_REGION`.
5. Create `dev-readonly` IAM user or SSO and map to k8s user (see `k8s/rbac/aws-auth-mapusers.tpl.yaml`).
6. Push to GitHub: PR -> plan runs; merge to main -> apply runs.

## Folder layout

- `infra/terraform/` — Terraform IaC
- `k8s/` — Kubernetes manifests (namespace, apps, infra, rbac)
- `.github/workflows/` — GitHub Actions for Terraform
- `scripts/` — helper scripts

## Notes & next steps

- Replace in-cluster DBs with managed RDS/DynamoDB by following the "bonus" approach in docs.
- Use AWS Secrets Manager + ExternalSecrets operator to avoid storing secrets in repo.

### Deploy Instructions

```bash
cd infra/terraform
terraform init
terraform apply -auto-approve
