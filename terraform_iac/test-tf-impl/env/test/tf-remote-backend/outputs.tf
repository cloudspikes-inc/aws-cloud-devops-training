output "s3_name" {
    value = aws_s3_bucket.bucket.id
}

output "db_name" {
    value = aws_dynamodb_table.terraform-lock.id
}