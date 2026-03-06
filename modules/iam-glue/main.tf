# Glue execution role (assumed by AWS Glue)
resource "aws_iam_role" "glue_exec" {
    name = "glue-exec-${var.environment}"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement =[{
            Effect = "Allow"
            Principal = {
                Service = "glue.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }]
    })
}