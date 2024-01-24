data "archive_file" "lambda" {
    type = "zip"
    source_file = "sampleFunction.py"
    output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "sample_function" {
  filename = "lambda_function_payload.zip"
  function_name = "sample_lambda_function"
  role = aws_iam_role.iam_for_lambda.arn
  handler = "sampleFunction.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime = "python3.9"

  environment {
    variables = {
      env = var.env
      content = var.content
    }
  }
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sample_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.myregion}:${var.accountId}:${aws_api_gateway_rest_api.api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}
