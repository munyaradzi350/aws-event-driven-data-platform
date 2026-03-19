# This tells Terraform to create an AWS Lambda function
resource "aws_lambda_function" "this" {
  # This sets the actual Lambda function name in AWS
  function_name = var.function_name
  #  Lambda must assume an IAM role when it runs.
  role = var.role_arn
  # This tells AWS which runtime to use for the Lambda function.  
  runtime = var.runtime
  # This tells Lambda where execution starts.  
  handler = var.handler
  #This tells Terraform where the zipped Lambda deployment package is. Terraform will upload that zip file to AWS Lambda. 
  filename = var.filename
}