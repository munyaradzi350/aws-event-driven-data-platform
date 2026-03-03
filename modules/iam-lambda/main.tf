# Lambda execution role (assumed by AWS Lambda)
resource "aws_iam_role" "lambda_exec" {
    name = "lambda-exec-${var.environment}"

    assume_role_policy = jsonencode({
        version = "2012-10-17"
        statement = [{
            Effect = "Allow"
            Principal = {
                Service = "lambda.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }]
    })
}