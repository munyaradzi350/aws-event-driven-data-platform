# Export the Glue role ARN for use in other modules
output "role_arn" {
    value = aws_iam_role.glue_exec.arn
}

# Export the Glue role name
output "role_name" {
    value = aws_iam_role.glue_exec.name
}