output "kubeconfig_command" {
  description = "Command to update your local kubeconfig for this EKS cluster"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}
