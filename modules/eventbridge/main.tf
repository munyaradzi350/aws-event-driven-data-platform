resource "aws_cloudwatch_event_rule" "s3_object_created" {
  name = var.rule_name

  event_pattern = jsonencode({
    source = [
        "aws.s3"
    ]

    detail-type = [
        "Object Created"
    ]

    detail = {
        bucket = {
            name = [
                var.bucket_name
            ]
        }

        object = {
            key = [
                {
                    prefix = "incoming/"
                }
            ]
        }
    }
  })
}