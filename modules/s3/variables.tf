#Declaring an input called bucket_name because the module won't hardcode bucket name
variable "bucket_name" {
  #Human readable note    
  description = "S3 bucket name"
  #This forces the input to be text, like "my-bucket-name"    
  type = string
}

variable "folders" {
  description = "List of folder prefixes to create"
  type = list(string)
  default = []
}