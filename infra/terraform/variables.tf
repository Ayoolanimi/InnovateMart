variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "innovatemart-bedrock"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.16.0/20", "10.0.32.0/20"]
}

variable "node_group_desired" {
  description = "Desired number of nodes in the managed node group"
  type        = number
  default     = 3
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "ssh_key_name" {
  description = "Name of an existing EC2 Key Pair to enable SSH access to worker nodes"
  type        = string
  default     = "aws"
}

variable "aws_account_id" {
  description = "AWS Account ID (optional — for tagging or IAM roles)"
  type        = string
  default     = "187483722887"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.28"
}

