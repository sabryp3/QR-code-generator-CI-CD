# Outputs to see what IAM roles and SGs are created
output "cluster_iam_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = module.eks.cluster_iam_role_arn
}

output "cluster_iam_role_name" {
  description = "Name of the EKS cluster IAM role"
  value       = module.eks.cluster_iam_role_name
}

output "cluster_autoscaler_iam_role_arn" {
  description = "IAM role ARN for the cluster autoscaler"
  value       = module.irsa_cluster_autoscaler.arn
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

output "node_security_group_id" {
  description = "Security group ID attached to the EKS nodes"
  value       = module.eks.node_security_group_id
}

output "cluster_endpoint" {
  description = "Endpoint for your EKS cluster"
  value       = module.eks.cluster_endpoint
  sensitive   = true
}

output "cluster_platform_version" {
  description = "Platform version for the cluster"
  value       = module.eks.cluster_platform_version
}
output "cluster_status" {
  description = "Status of the EKS cluster. One of `CREATING`, `ACTIVE`, `DELETING`, `FAILED`"
  value       = module.eks.cluster_status
}


# Kubectl Configuration
output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.aws_region}"
}