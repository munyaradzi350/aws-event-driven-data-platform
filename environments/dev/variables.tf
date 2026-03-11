variable "environment" {
    description = "Environment name (dev/staging/prod)"
    type = string
}

variable "aws_region" {
    description = "AWS region where resources will be deployed"
    type = string
}

variable "project_name" {
    description = "Name of the project"
    type = string
}