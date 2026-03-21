output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = module.lambda_trigger.function_name
}

output "lambda_function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = module.lambda_trigger.function_arn
}