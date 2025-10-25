locals {
  cluster_name = var.cluster_name
}

data "aws_availability_zones" "available" {}

# ---------------- VPC MODULE ----------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name                 = "${local.cluster_name}-vpc"
  cidr                 = var.vpc_cidr
  azs                  = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets       = var.public_subnet_cidrs
  private_subnets      = var.private_subnet_cidrs
  map_public_ip_on_launch = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_flow_log      = false
}


# ---------------- EKS MODULE ----------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.31"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = concat(module.vpc.public_subnets, module.vpc.private_subnets)

  eks_managed_node_groups = {
    default = {
      ami_type       = "AL2_x86_64"
      instance_types = [var.node_instance_type]
      disk_size      = 20

      desired_size = var.node_group_desired
      max_size     = var.node_group_desired + 1
      min_size     = 1
      key_name     = var.ssh_key_name
    }
  }

  tags = {
    Project = "Project-Bedrock"
    Owner   = "InnovateMart"
  }
}

# ---------------- OUTPUTS ----------------
output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "node_group_arns" {
  value = { for name, group in module.eks.eks_managed_node_groups : name => group.node_group_arn }
}
