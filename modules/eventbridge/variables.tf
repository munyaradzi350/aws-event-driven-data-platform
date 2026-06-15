variable "rule_name" {
  description = "Name of the EventBridge rule"
  type = string
}

variable "bucket_name" {
  description = "S3 bucket to monitor"
  type = string
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type = string
}

variable "lambda_function_arn" {
  description = "Lambda function ARN"
  type = string
}

variable "incoming_prefix" {
  description = "S3 prefix that triggers the pipeline"
  type = string
}