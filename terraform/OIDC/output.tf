# Output the role ARN for use in GitHub Actions workflow
output "github_actions_role_arn" {
  value       = aws_iam_role.github_deploy.arn
  description = "ARN of the role for GitHub Actions to assume"
}