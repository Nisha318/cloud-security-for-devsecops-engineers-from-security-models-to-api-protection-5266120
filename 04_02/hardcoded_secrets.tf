resource "aws_ssm_parameter" "example_secret" {
  name        = "/demo/hardcoded-secret"
  type        = "SecureString"
  value       = "SuperSecretPassword123!" # 🔐 hardcoded secret
  description = "A test secret stored in Parameter Store"
  overwrite   = true
  tier        = "Standard"
}
