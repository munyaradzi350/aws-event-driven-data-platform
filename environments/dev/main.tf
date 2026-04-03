module "raw_bucket" {
  source      = "../../modules/s3"
  bucket_name = "customer-platform-dev-raw-munya-001"
}

module "curated_bucket" {
  source      = "../../modules/s3"
  bucket_name = "customer-platform-dev-curated-munya-002"
}

module "scripts_bucket" {
  source      = "../../modules/s3"
  bucket_name = "customer-platform-dev-scripts-munya-003"
}

module "lambda_artifacts_bucket" {
  source      = "../../modules/s3"
  bucket_name = "event-driven-data-platform-dev-lambda-artifacts"
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
  glue_job_name = module.glue_job.job_name
}

module "glue_job" {
  source = "../../modules/glue"

  job_name          = "event-driven-data-platform-dev-glue-job"
  role_arn          = module.iam-glue.role_arn
  script_location   = "s3://customer-platform-dev-scripts-munya-003/glue/glue_job.py"
  glue_version      = "4.0"
  worker_type       = "G.1X"
  number_of_workers = 2
}

module "iam_github_oidc" {
  source = "../../modules/iam-github-oidc"

  github_repo = "munyaradzi350/aws-event-driven-data-platform"

  allowed_branches = [
    "main",
    "feature/*"
  ]

  lambda_arns = [
    "arn:aws:lambda:us-east-1:694322569546:function:event-driven-data-platform-dev-trigger"
  ]

  s3_bucket_arns = [
    "arn:aws:s3:::event-driven-data-platform-dev-lambda-artifacts/*"
  ]
}