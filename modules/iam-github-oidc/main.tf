locals {
  github_sub_conditions = [
    for branch in var.allowed_branches :
    "repo:${var.github_repo}:ref:refs/heads/${branch}"
  ]
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

resource "aws_iam_role" "github_actions_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          },
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_repo}:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_actions_policy" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      # Lambda permissions
      {
        Effect = "Allow",
        Action = [
          "lambda:UpdateFunctionCode",
          "lambda:PublishVersion",
          "lambda:UpdateAlias",
          "lambda:CreateAlias"

        ],
        Resource = var.lambda_arns
      },

      # S3 permissions
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ],
        Resource = "arn:aws:s3:::customer-platform-dev-scripts-munya-003"
      },

      # Glue deployment permissions
      {
        Effect = "Allow",
        Action = [
          "glue:UpdateJob",
          "glue:GetJob"
        ],
        Resource = "arn:aws:glue:us-east-1:694322569546:job/event-driven-data-platform-dev-glue-job"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.github_actions_policy.arn
}