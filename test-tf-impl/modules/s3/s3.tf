resource "aws_s3_bucket" "app_s3_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_tags_name
    Project     = var.s3_tags_project
    Role        = var.s3_tags_role
    Environment = var.s3_tags_env
    ManagedBy   = var.s3_tags_mgd_by
  }
}