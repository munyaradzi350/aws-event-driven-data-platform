variable "aws_region" {
    description = "AWS region for the backend resources"
    type = string
}

variable "state_bucket_name" {
    description = "Name of the S3 bucket used to store Terraform state"
    type = string
}

variable "lock_table_name" {
    description = "Name of the DynamoDB table used for Terraform state locking"
    type = string
}