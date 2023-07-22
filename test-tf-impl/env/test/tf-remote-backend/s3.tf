resource "aws_s3_bucket" "bucket" {
  bucket = "tf-remote-backend-bucket-esrcgs9er7f"
  versioning {
    enabled = var.s3_object_versioning_enabled
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name        = "tf-remote-backend-s3"
    Project     = "cloudspikes.ca"
    Role        = "to persist the tf state file"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}
