# Ouput the name of the Terraform state bucket
output "terraform_state_bucket_name" {
    description = "Name of the S3 bucket used to store Terraform state"
    value = aws_s3_bucket.terraform_state.id
}

# State bucket ARN
output "terraform_state_bucket_arn" {
  description = "ARN of the Terraform state S3 bucket"
  value = aws_s3_bucket.terraform_state.arn
}

# Output the name of the DynamoDB table used for Terraform state locking
output "terraform_lock_table_name" {
  description = "Name of the Terraform lock table"
  value = aws_dynamodb_table.terraform_locks.name
}

# DynamoDB lock table ARN
output "terraform_lock_table_arn" {
  description = "ARN of the Terraform lock table"
  value = aws_dynamodb_table.terraform_locks.arn
}