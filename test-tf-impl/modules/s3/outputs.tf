output "bucket_id" {
  value = aws_s3_bucket.app_s3_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.app_s3_bucket.arn
}