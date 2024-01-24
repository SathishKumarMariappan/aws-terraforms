resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/sample_lambda_function"
  retention_in_days = 7
}