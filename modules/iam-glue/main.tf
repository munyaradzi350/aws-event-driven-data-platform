# Glue execution role (assumed by AWS Glue)
resource "aws_iam_role" "glue_exec" {
  name = "glue-exec-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "glue.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach the standard Glue service policy to help Glue run jobs, write logs, and interact with core Glue service features.

#This attaches a policy to an IAM role
resource "aws_iam_role_policy_attachment" "glue_service" {
  #Attach the policy to the Glue role created.
  role = aws_iam_role.glue_exec.name
  #This is an AWS-managed policy for Glue service basics.
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

# Custom S3 permissions for Glue to read/write data in the specified S3 bucket
resource "aws_iam_policy" "glue_s3_access" {
  name = "glue-s3-access-${var.environment}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = var.raw_bucket_arn
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject"
        ]
        Resource = "${var.raw_bucket_arn}/*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject"
        ]
        Resource = "${var.curated_bucket_arn}/*"
      }
    ]
  })
}

# Attach the custom S3 access policy to the Glue execution role
resource "aws_iam_role_policy_attachment" "glue_s3_access" {
  role       = aws_iam_role.glue_exec.name
  policy_arn = aws_iam_policy.glue_s3_access.arn
}