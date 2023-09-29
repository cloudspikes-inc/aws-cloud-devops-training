output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform-lock.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.terraform-lock.arn
}

output "s3_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "s3_arn" {
  value = aws_s3_bucket.bucket.arn
}