module "raw_bucket" {
  source      = "../../modules/s3"
  bucket_name = "customer-platform-dev-raw-munya-001"
}

module "curated_bucket" {
  source      = "../../modules/s3"
  bucket_name = "customer-platform-dev-curated-munya-002"
}

module "iam-lambda" {
  source      = "../../modules/iam-lambda"
  environment = "dev"
}

module "iam-glue" {
  source      = "../../modules/iam-glue"
  environment = "dev"
}