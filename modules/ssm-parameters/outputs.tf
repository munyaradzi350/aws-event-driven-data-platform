output "parameter_names" {
  value = keys(aws_ssm_parameter.parameters)
}

output "parameter_arns" {
  value = [
    for parameter in aws_ssm_parameter.parameters :
    parameter.arn
  ]
}