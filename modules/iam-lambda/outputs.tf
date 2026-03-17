# Export the Lambda role ARN for use in other modules

output "lambda_role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

# Export the role name (useful for attachments later)
output "lambda_role_name" {
  value = aws_iam_role.lambda_exec.name
}