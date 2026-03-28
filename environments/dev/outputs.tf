output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = module.lambda_trigger.function_name
}

output "lambda_function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = module.lambda_trigger.function_arn
}

output "glue_job_name" {
  description = "Name of the Glue job in dev"
  value       = module.glue_job.job_name
}

output "glue_job_arn" {
  description = "ARN of the Glue job in dev"
  value       = module.glue_job.job_arn
}