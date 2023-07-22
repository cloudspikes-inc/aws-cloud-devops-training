terraform {
  backend "s3" {
    bucket         = "tf-remote-backend-bucket-esrcgs9er7f"
    key            = "terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "tf-remote-backend-dynamodb-table"
  }
}