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
  source             = "../../modules/iam-glue"
  environment        = "dev"
  raw_bucket_arn     = module.raw_bucket.bucket_arn
  curated_bucket_arn = module.curated_bucket.bucket_arn
}

module "lambda_trigger" {
  source = "../../modules/lambda"

  function_name = "event-driven-data-platform-dev-trigger"
  role_arn      = module.iam-lambda.role_arn
  runtime       = "python3.12"
  handler       = "lambda_function.lambda_handler"
  filename      = "../../scripts/lambda/lambda_function.zip"
}

module "glue_job" {
  source = "../../modules/glue"

  job_name          = "event-driven-data-platform-dev-glue-job"
  role_arn          = module.iam-glue.role_arn
  script_location   = ""
  glue_version      = "4.0"
  worker_type       = "G.1X"
  number_of_workers = 2
}