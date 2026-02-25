resource "aws_s3_bucket" "this" {
    bucket = var.bucket_name
  
}

#Prevent public access to the bucket
resource "aws_s3_bucket_public_access_block" "this" {
    bucket = aws_s3_bucket.this.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

# Keep file history, if someone overwrites/delete a file you can recover it.
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Encrypt objects by default when they are stored in the bucket
#aws_s3_bucket_server_side_encryption_configuration - tells AWS that this bucket automatically encrypt every object stored inside it.
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
#Attaching this encryption rule to the bucket    
    bucket = aws_s3_bucket.this.id

    rule {
#Apply encryption automatically to every new object uploaded.        
      apply_server_side_encryption_by_default {
#Specifying the encryption type, Advanced Encryption Standard with 256-bit key length.        
        sse_algorithm = "AES256"
      }
    }
}
    