resource "aws_dynamodb_table" "terraform-lock" {
  name           = "tf-remote-backend-dynamodb-table"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "tf-remote-backend-dynamodb-table"
    Project     = "cloudspikes.ca"
    Role        = "to persist the tf state file"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}