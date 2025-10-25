#!/usr/bin/env bash
set -e
CLUSTER_NAME=${1:-innovatemart-bedrock}
REGION=${2:-us-east-1}
aws eks update-kubeconfig --name "$CLUSTER_NAME" --region "$REGION"
echo "kubeconfig updated for $CLUSTER_NAME"
