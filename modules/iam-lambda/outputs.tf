# Export the Lambda role ARN for use in other modules

output "role_arn" {
  description = "ARN of the Lambda execution role"
  value       = aws_iam_role.lambda_exec.arn
}

# Export the role name (useful for attachments later)
output "role_name" {
  description = "Name of the Lambda execution role"
  value       = aws_iam_role.lambda_exec.name
}