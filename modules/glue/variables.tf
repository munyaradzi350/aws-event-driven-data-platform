variable "job_name" {
  description = "Name of the Glue job"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN used by Glue job"
  type        = string
}

variable "script_location" {
  description = "S3 path to the Glue job script"
  type        = string
}

variable "glue_version" {
  description = "Version of AWS Glue to use"
  type        = string
}

variable "worker_type" {
  description = "Worker type for the Glue job"
  type        = string
}

variable "number_of_workers" {
  description = "Number of workers for the Glue job"
  type        = string
}