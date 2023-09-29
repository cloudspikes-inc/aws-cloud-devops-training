resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state_db_4958t45wc0"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}