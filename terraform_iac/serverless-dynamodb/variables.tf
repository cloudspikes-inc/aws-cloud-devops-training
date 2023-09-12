variable "lambda_function_timeout" {
  description = "Timeout value for the lambda function execution."
  type        = number
  default     = 15
}

variable "lambda_function_memory" {
  description = "Memory value for the lambda function execution."
  type        = number
  default     = 512
}

variable "aws_ak" {
  description = "AWS Access Key value for the lambda function execution."
  type        = string
}

variable "aws_sk" {
  description = "AWS Secret Key value for the lambda function execution."
  type        = string
}

variable "aws_region" {
  description = "AWS default region value for the lambda function execution."
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID value for the lambda function execution."
  type        = string
}