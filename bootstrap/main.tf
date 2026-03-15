# S3 bucket for storing Terraform state files
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket_name
}
