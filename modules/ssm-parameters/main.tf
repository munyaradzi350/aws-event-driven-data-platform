resource "aws_ssm_parameter" "parameters" {
  for_each = var.parameters

  name  = each.key
  type  = "String"
  value = each.value

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}