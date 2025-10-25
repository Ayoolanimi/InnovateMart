#!/usr/bin/env bash
# Example: create an IAM user and attach read-only policy (copy dev-readonly-policy.json to same dir)
set -e
USER_NAME=${1:-dev-readonly}

aws iam create-user --user-name "${USER_NAME}" || true
aws iam put-user-policy --user-name "${USER_NAME}" --policy-name DevReadOnlyInline --policy-document file://infra/terraform/iam/dev-readonly-policy.json
echo "Created user ${USER_NAME} and attached inline policy. Run aws iam create-access-key --user-name ${USER_NAME} to get keys."
