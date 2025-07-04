# This Terraform configuration creates a Lambda function 
# with a default configuration
resource "aws_lambda_function" "default_configuration" {
  function_name = "default-configuration-lambda"
  role          = aws_iam_role.lambda_exec.arn
  runtime       = "python3.12"
  handler       = "index.handler"
  filename      = "function.zip"
}

# This resource only allows EventBridge to invoke the Lambda function.
# It does not allow any other services or principals to invoke it.
resource "aws_lambda_permission" "allow_eventbridge_only" {
  statement_id  = "AllowExecutionFromEventBridgeOnly"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.default_configuration.function_name
  principal     = "events.amazonaws.com"
  source_arn    = "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:rule/secure-event-rule"
}

# This resource creates an IAM role for Lambda function with minimal permissions.
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
