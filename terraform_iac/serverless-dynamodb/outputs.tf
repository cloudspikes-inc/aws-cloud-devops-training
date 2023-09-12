output "lambda_arn" {
  value = aws_lambda_function.test_lambda.arn
}

output "test_dyanamodb_resource_url" {
  value = aws_api_gateway_resource.MyDemoResource.path
}

output "stage_url" {
  value = aws_api_gateway_stage.api_gw_test_stage.invoke_url
}