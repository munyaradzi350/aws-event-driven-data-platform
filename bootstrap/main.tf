# S3 bucket for storing Terraform state files
resource "aws_s3_bucket" "terraform_state" {
    bucket = var.state_bucket_name
}

# Enable versioning on the Terraform state bucket
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
    bucket = aws_s3_bucket.terraform_state.id

    versioning_configuration {
      status = "Enabled"
    }
}

# Encrypt objects stored in the Terraform state bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
    bucket = aws_s3_bucket.terraform_state.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}