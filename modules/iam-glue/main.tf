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
  role       = aws_iam_role.glue_exec.name
  #This is an AWS-managed policy for Glue service basics.
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}