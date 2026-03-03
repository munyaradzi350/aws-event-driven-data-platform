# Export the Lambda role ARN for use in other modules

output "role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

# Export the role name (usefil for attachments later)
output "role_name" {
  value = aws_iam_role.lambda_exec.name
}