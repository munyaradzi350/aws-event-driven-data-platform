# This tells Terraform to create an AWS Lambda function
resource "aws_lambda_function" "this" {
# This sets the actual Lambda function name in AWS
  function_name = var.function_name
#  
  role = var.role_arn
  runtime = var.runtime
  handler = var.handler
  filename = var.filename
}