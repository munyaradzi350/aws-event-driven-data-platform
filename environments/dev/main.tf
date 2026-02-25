module "raw_bucket" {
    source = "../../modules/s3"
    bucket_name = "customer-platform-dev-raw-munya-001"
}