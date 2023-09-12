resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "demo-1.0.0.jar"
  function_name = "lambda_function_java_tf"
  role          = "arn:aws:iam::615311846444:role/service-role/test-java-lambda-role"
  handler       = "com.amazonaws.lambda.demo.LambdaFunctionHandler::handleRequest"
  timeout       = var.lambda_function_timeout
  memory_size   = var.lambda_function_memory

  source_code_hash = filebase64sha256("demo-1.0.0.jar")

  runtime = "java17"

  environment {
    variables = {
      AWS_AK                   = var.aws_ak
      AWS_SK                   = var.aws_sk
      AWS_DEFAULT_REGION_VALUE = var.aws_region
      AWS_ACCOUNT_ID           = var.aws_account_id
    }
  }
}