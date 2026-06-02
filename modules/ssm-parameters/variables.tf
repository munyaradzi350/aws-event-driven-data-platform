variable "environment" {
  description = "Deployment environment"
  type = string
}

variable "parameters" {
  description = "Map of SSM parameters to create"
  type = map(string)
}