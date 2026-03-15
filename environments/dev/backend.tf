terraform {
  backend "s3" {
    bucket = "munya-event-platform-tf-state"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "munya-event-platform-tf-locks"
    encrypt = true
  }
}