variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN used by the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
}

variable "handler" {
  description = "Function entrypoint for Lambda"
  type        = string
}

variable "filename" {
  description = "Path to the zipped Lambda deployment package"
  type        = string
}
