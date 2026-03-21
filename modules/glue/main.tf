# This tells Terraform to create an AWS Glue job
resource "aws_glue_job" "this" {
  name     = var.job_name
  role_arn = var.role_arn

  # command {...} this block defines how the Glue job should run, like telling AWS what kind of job this is, where the script is, what Python version to use.  
  command {
    # This tells Glue the command type. glueetl means run a Spark ETL job. This is the normal setting for PySpark Glue jobs.  
    name = "glueetl"
    # This tells Glue where the script lives. For Glue the script location is usually an S3 path. 
    script_location = var.script_location
    # This sets the Glue runtime version.  
    python_version = "3"
  }

  glue_version      = var.glue_version
  worker_type       = var.worker_type
  number_of_workers = var.number_of_workers
}