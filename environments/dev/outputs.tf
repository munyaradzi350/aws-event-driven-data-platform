output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = module.lambda_trigger.function_name
}

output "lambda_function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = module.lambda_trigger.function_arn
}

output "glue_role_arn" {
  description = "ARN for Glue execution role"
  value = module.iam-glue.role_arn
}

output "glue_job_name" {
  description = "Name of the Glue job in dev"
  value       = module.glue_job.job_name
}

output "glue_job_arn" {
  description = "ARN of the Glue job in dev"
  value       = module.glue_job.job_arn
}

output "github_actions_role_arn" {
  description = "ARN of the IAM role for GitHub Actions"
  value       = module.iam_github_oidc.github_actions_role_arn
}