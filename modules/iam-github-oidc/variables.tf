variable "github_repo" {
  description = "GitHub repository in format org/repo"
  type        = string
}

variable "role_name" {
  description = "IAM role name for GitHub Actions"
  type        = string
  default     = "GitHubActionRole"
}

variable "policy_name" {
  description = "IAM policy name"
  type        = string
  default     = "GitHubActionsLambdaDeployPolicy"
}

variable "allowed_branches" {
  description = "Branches allowed to assume the role"
  type        = list(string)
  default     = ["*"]
}

variable "lambda_arns" {
  description = "List of Lambda ARNs allowed to update"
  type        = list(string)
  default     = ["*"]
}

variable "s3_bucket_arns" {
  description = "List of S3 bucket ARNs for artifact upload"
  type        = list(string)
  default     = ["*"]
}