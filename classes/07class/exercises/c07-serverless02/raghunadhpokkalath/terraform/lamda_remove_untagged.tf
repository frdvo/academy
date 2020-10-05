resource "aws_lambda_function" "remove_untagged_instance" {
  filename         = var.remove_untagged_instance
  function_name    = "remove_untagged_instance"
  handler          = "remove_untagged_instance.lambda_handler"
  runtime          = var.lamda_runtime
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = filebase64sha256(var.remove_untagged_instance)

  tags = {
    Name = "${var.project_name}-remove_untagged_instance-lamda"
  }

  environment {
    variables = {
      SNS_ARN = aws_sns_topic.this.arn
    }
  }

}

resource "aws_cloudwatch_log_group" "report_count" {
  name              = "/aws/lambda/${aws_lambda_function.remove_untagged_instance.function_name}"
  retention_in_days = 1
}

#resource "aws_lambda_event_source_mapping" "this" {
# event_source_arn  = aws_dynamodb_table.da_serverless.stream_arn
#enabled           = true
#function_name     = aws_lambda_function.report_count_lamda.arn
#starting_position = "LATEST"
#}


resource "aws_lambda_permission" "cloudwatchevent" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.da_create_customer.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.customer.execution_arn}/*/*"
}