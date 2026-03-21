# This is the real Glue job name in AWS
variable "job_name" {
  description = "Name of the Glue job"
  type        = string
}

# Glue IAM role arn used by Glue job to run
variable "role_arn" {
  description = "IAM role ARN used by Glue job"
  type        = string
}

# Glue runs a script that is stored in S3 unlike Lambda which needs a local zip file
variable "script_location" {
  description = "S3 path to the Glue job script"
  type        = string
}

# This sets the Glue runtime version
variable "glue_version" {
  description = "Version of AWS Glue to use"
  type        = string
}

# This controls the type of workers used by the Glue job
variable "worker_type" {
  description = "Worker type for the Glue job"
  type        = string
}

# This controls how many workers Glue uses
variable "number_of_workers" {
  description = "Number of workers for the Glue job"
  type        = number
}