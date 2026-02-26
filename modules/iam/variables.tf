variable "environment" {
    description = "Environment name (dev/staging/prod)"
    type = string
}

variable "raw_bucket_arn" {
    description = "ARN of the raw S3 bucket"
    type = string
}

variable "curated_bucket_arn" {
    description = "ARN of the curated S3 bucket"
    type = string
}